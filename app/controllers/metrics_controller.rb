class MetricsController < ApplicationController
  before_action :find_metric, only: [:show]
  include ClientableControllerConcern

  def index
    @metric = Metric.all.order('created_at DESC')
  end
  def show

  end

  private
  def metric_params
    params.require(:metric).permit(:name, :unit)
  end

  def find_metric
    @metric = Metric.find(params[:id])
  end

end