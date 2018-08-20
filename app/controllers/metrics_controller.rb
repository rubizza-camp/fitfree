# for metrics
class MetricsController < ApplicationController
  before_action :find_metric, only: [:show]
  include ClientableControllerConcern

  def index
    @metrics = if @client
                 @client.metrics
               else
                 Metric.all
               end
    @metrics = @metrics.order(created_at: :desc)
  end

  def show; end

  def new
    @metric = Metric.new
    @kinds = Kind.all.map { |k| [k.name, k.id] }
  end

  def create
    @metric = Metric.new(metric_params)
    if @metric.save
      redirect_to metrics_path
    else
      render 'new'
    end
  end

  private

  def metric_params
    params.require(:metric).permit(:name, :units, :kind_id)
  end

  def find_metric
    @metric = Metric.find(params[:id])
  end
end
