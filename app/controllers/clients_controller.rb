# for clients
class ClientsController < ApplicationController
  before_action :find_client, only: %i[show edit update destroy]
  before_action :set_metrics, only: %i[new edit]
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @clients = current_user.clients.order(:first_name).page(params[:page])
    @clients = @clients.where(status: params[:status]) if params[:status].present?
    authorize @clients
  end

  def show
    authorize @client
    @snapshots = @client.snapshots.includes(measurements: :metric)
  end

  def new
    @client = current_user.clients.build
    authorize @client
  end

  def create
    if params[:metrics] != nil
      params[:metrics].map!(&:to_i)
    end
    @client = current_user.clients.build(params)
    authorize @client
    if @client.save
      redirect_to @client
    else
      render 'new'
    end
  end

  def stats
    @client = Client.find(params[:client_id])
    authorize @client
    @snapshots = @client.snapshots.includes(measurements: :metric)
  end

  def edit; end

  def update
    authorize @client
    if @client.update(client_params)
      redirect_to @client
    else
      render 'edit'
    end
  end

  def destroy
    authorize @client
    @client.destroy
    redirect_to clients_path
  end

  private

  def find_client
    @client = Client.find(params[:id])
  end

  def client_params
    #binding.pry
    params.require(:client).permit(:status, :gender, :first_name, :second_name, :phone_number,
                                    :email, :instagram_link, :facebook_link, :vk_link, :price,
                                    :metrics, :birth)
  end

  def set_metrics
    @metrics = Metric.all
  end
end
