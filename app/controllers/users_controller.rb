class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to root_path, :alert => "Access denied."
      end
    end
  end

  def create
    response = regist_webhooks_for_bot
    if response.status == 200 && JSON.parse(response.body)['result']
      telegram_bot = TelegramBot.find(user_id:params[:id])
      telegram_bot.token = token
      telegram_bot.telegram_webhook_id = webhook_id
    end
    redirect_to :index
  end

  def token
    params['token']
  end

  def regist_webhooks_for_bot
    Excon.get("https://api.telegram.org/bot#{token}/setWebhook?url=#{params['url']}/webhooks/#{webhook_id}")
  end


  def webhook_id
    @telegram_webhook_id ||= SecureRandom.uuid
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
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:role, :name)
  end
end
