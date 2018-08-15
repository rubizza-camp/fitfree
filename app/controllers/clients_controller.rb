class ClientsController < ApplicationController
  before_action :find_client, only: [:show, :edit, :update, :destroy]
  before_action :set_metrics, only: [:new, :edit]
  before_action :authenticate_user!

  def index
    #@client = Client.where(user_id: current_user)
    if params[:status].blank?
      @client = Client.where(user_id: current_user)
    else
      @status_id = Status.find_by(name: params[:status]).id
      @client = Client.where(status_id: @status_id).where(user_id: current_user)
    end

  end

  def show
    @snapshots = @client.snapshots.includes(measurements: :metric)
  end

  def new
    @client = current_user.clients.build
    @statuses = Status.all.map{|s| [s.name, s.id]}
  end

  def create
    #require "pry"; binding.pry
    @client = current_user.clients.build(client_params)
    @client.status_id = params[:status_id]
    if @client.save
      redirect_to @client
    else
      render 'new'
    end
  end

  def stats
    @client = Client.find(params[:client_id])
    @snapshots = @client.snapshots.includes(measurements: :metric)
  end

  def edit
    @statuses = Status.all.map{|s| [s.name, s.id]}
  end

  def update
    #require "pry"; binding.pry
    @client.status_id = params[:status_id]
    if @client.update(client_params)
      redirect_to @client
    else
      render 'edit'
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  private
  def find_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).slice(:metric_ids, :first_name, :second_name, :phone_number,:status_id,
                                  :birth, :email, :instagram_link, :facebook_link, :vk_link,
                                  "birth(1i)", "birth(2i)", "birth(3i)").permit!
  end

  def set_metrics
    @metrics = Metric.all
  end
end
