module Admin
  class UsersController < Admin::ApplicationController

    before_action :set_user, only: [:block, :unblock]

    def reset_password
      requested_resource.send_reset_password_instructions
      flash[:notice] = 'password was successfully reset!'
    end

    def block
      requested_resource.block!
    end

    def unblock
      requested_resource.unblock!
    end

    def create
      # resourse = user
      #binding.pry
      resource = resource_class.new(resource_params)
      authorize_resource(resource)
      resource.telegram_bot = TelegramBot.new
      if resource.save
        register_webhooks_for_bot(resource)
        redirect_to(
          [namespace, resource],
          notice: translate_with_resource("create.success"),
        )
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, resource),
        }
      end
    end

    def update
      # default administrate implementation!!!
      if requested_resource.update(resource_params)
        redirect_to(
          [namespace, requested_resource],
          notice: translate_with_resource("update.success"),
        )
      else
        render :edit, locals: {
          page: Administrate::Page::Form.new(dashboard, requested_resource),
        }
      end
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
      redirect_to users_path, notice: 'User deleted.'
    end

    private

    def set_user
      @user = requested_resource
    end

    #move to callback
    def register_webhooks_for_bot(user)
      Excon.get("https://api.telegram.org/bot#{user.bot_token}/setWebhook?url=https:/#{request.server_name}{/#{user.bot_webhook_id}")
    end

  
  end
end
