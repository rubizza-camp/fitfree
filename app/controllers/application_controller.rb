class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!

  def pundit_user
    current_user || current_admin
  end
end
