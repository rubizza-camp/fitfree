class TrainingsController < ApplicationController
  include Sidekiq::Worker
  before_action :find_training, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @training = Training.where(user_id: current_user)
  end

  def show
  end

  def new
    @training = current_user.trainings.build
  end

  def create
    @training = current_user.trainings.build(training_params)
    if @training.save
      tmp = WithdrawPaymentJob.set(wait_until: @training.time)
                .perform_later({ :client_id => @training.client_id,
                                 :user_id => @training.user_id,
                                 :time => @training.time,
                                 :price => @training.price }
                                   .to_json)
      puts params.inspect
      # puts tmp.job_id
      redirect_to @training
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @training.update(training_params)
      redirect_to @training
    else
      render 'edit'
    end
  end

  def destroy
    @training.destroy
    redirect_to trainings_path
  end

  private
  def find_training
    @training = Training.find(params[:id])
  end

  def training_params
    params[:training][:price] = Client.find(params[:training][:client_id])
                                    .price if params[:training][:price] == ""
    params.require(:training).slice(:time, :price, :description, :client_id, :status, :cancel,
                                    "time(1i)", "time(2i)", "time(3i)", "time(4i)", "time(5i)").permit!
  end
end
