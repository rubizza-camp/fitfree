class ApplicationController < ActionController::Base
  before_action :pundit_user
  include Pundit
  protect_from_forgery with: :exception

  private

  def pundit_user
    current_user || current_admin
  end
end
