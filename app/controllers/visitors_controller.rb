class VisitorsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      redirect_to users_path
    else
      redirect_to clients_path
    end
  end
end
