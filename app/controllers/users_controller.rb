class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, except: :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to root_path, alert: 'Access denied.'
      end
    end
  end

  def edit
    @user = User.find_by(id: params["id"])
    unless @user.coach_info
      @user.build_coach_info
      @user.save
    end
    unless @user.telegram_bot
      @user.build_telegram_bot
      @user.save
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params) &&
        @user.telegram_bot.update_attributes(telegram_bot) &&
        @user.coach_info.update_attributes(coach_info)
      response = regist_webhooks_for_bot
      if response.status == 200 && JSON.parse(response.body)['result']
        redirect_to users_path, :notice => "User updated."
      else
        render 'edit', :alert => response.body.to_s
      end
    else
      redirect_to users_path, alert: 'Unable to update user.'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, notice: 'User deleted.'
  end

  private

  def bot
     @bot ||= User.find(params[:id]).telegram_bot
  end

  def regist_webhooks_for_bot
    Excon.get("https://api.telegram.org/bot#{bot[:token]}/setWebhook?url=https:/#{request.server_name}{/#{bot[:telegram_webhook_id]}")
  end

  def admin_only
    unless current_user.admin?
      redirect_to root_path, alert: 'Access denied.'
    end
  end

  def user_require_params
    params.require(:user)
  end

  def user_params
    user_require_params.permit(:name, :email)
  end

  def coach_info
    user_require_params.require(:coach_info).permit(:birthdate, :region, :town, :phone, :facebook_sn, :vk_sn, :instagram_sn)
  end

  def telegram_bot
    user_require_params.require(:telegram_bot).permit(:token)
  end
end
