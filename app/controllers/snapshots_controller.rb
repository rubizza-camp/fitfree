class SnapshotsController < ApplicationController
  include ClientableControllerConcern

  before_action :find_snapshot, only: [:show]

  def index
    @snapshots = @client.snapshots.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @snapshot = @client.snapshots.new
    @client.metrics.each do |metric|
      @snapshot.measurements.build(metric: metric)
    end
  end

  def create
    @snapshot = @client.snapshots.new(snapshot_params)
    if @snapshot.save
      redirect_to client_snapshots_path(@client)
    else
      render :new
    end
  end

  private

  def snapshot_params
    params.require(:snapshot).permit(:date, measurements_attributes: [:value, :metric_id])
  end

  def find_snapshot
    @snapshot = Snapshot.find(params[:id])
  end
end
