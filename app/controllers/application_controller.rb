class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :pundit_user
  include Pundit

  private

  def pundit_user
    current_user || current_admin
  end
end
