class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  include Pundit

  def pundit_user
    current_user || current_admin
  end
end
