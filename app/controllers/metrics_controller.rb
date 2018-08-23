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
    @metrics = @metrics.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    authorize @metrics
  end

  def show
    authorize @metric
  end

  def new
    @metric = Metric.new
    @kinds = Kind.all.map { |k| [k.name, k.id] }
    authorize @metric
  end

  def create
    @metric = Metric.new(metric_params)
    authorize @metric
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
