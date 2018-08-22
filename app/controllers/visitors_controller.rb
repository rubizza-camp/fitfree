class VisitorsController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to calendar_index_path
  end
end
