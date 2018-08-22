# This class is needed to store a snapshot for a certain date
class SnapshotsController < ApplicationController
  include ClientableControllerConcern

  before_action :find_snapshot, only: [:show]

  def index
    @snapshots = @client.snapshots
  end

  def show; end

  def new
    @snapshot = @client.snapshots.new
    @client.metrics.each do |metric|
      @snapshot.measurements.build(metric: metric)
    end
  end

  def create
    @snapshot = @client.snapshots.new(snapshot_params)
    if @snapshot.save
      redirect_to client_stats_path(@client)
    else
      render :new
    end
  end

  private

  def snapshot_params
    params.require(:snapshot).permit(:date, measurements_attributes:
      %i[value metric_id])
  end

  def find_snapshot
    @snapshot = Snapshot.find(params[:id])
  end
end
