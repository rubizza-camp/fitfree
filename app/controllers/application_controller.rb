class ApplicationController < ActionController::Base
  include Pundit

  def pundit_user
    current_user || current_admin
  end
end
