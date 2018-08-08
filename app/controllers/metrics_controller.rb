class MetricsController < ApplicationController
  before_action :find_metric, only: [:show]
  include ClientableControllerConcern

  def index
    @metric = Metric.all.order('created_at DESC')
  end
  def show

  end

  def new
    @metric = Metric.new
  end

  def create
    @metric = Metric.new(metric_params)
    if @metric.save
      redirect_to metric_path
    else
      render 'new'
    end
  end

  private

  def metric_params
    params.require(:metric).permit(:name, :units)
  end

  def find_metric
    @metric = Metric.find(params[:id])
  end
end