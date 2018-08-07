class MetersController < ApplicationController
  before_action :find_meter, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @meter = Meter.all.order('created_at DESC')
  end

  def new
    @meter = Meter.new
  end

  def create
    @meter = Meter.new(meter_params)
    if @meter.save
      redirect_to meters_path
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @meter.update(meter_params)
      redirect_to meters_path
    else
      render 'edit'
    end
  end
  def show
    @meter  = Meter.find(params[:id])
  end

  def destroy
    @meter.destroy
    redirect_to meters_path
  end

  private
  def meter_params
    params.require(:meter).permit(:name)
  end

  def find_meter
    @meter = Meter.find(params[:id])
  end
end
