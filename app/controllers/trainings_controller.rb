class TrainingsController < ApplicationController
  require 'sidekiq/api'
  before_action :find_training, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @training = Training.where(user_id: current_user).sort_by(&:time).reverse!
  end

  def show
  end

  def new
    @training = current_user.trainings.build
  end

  def create
    @training = current_user.trainings.build(training_params)
    if @training.save
      create_background_proc(@training.id)
      redirect_to @training
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @training.update(training_params)
      delete_background_proc(@training.id)
      create_background_proc(@training.id) unless training_params[:status] == :cancel
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

  def create_background_proc(training_id)
  # TODO: + 2 hours
  training = Training.find(training_id)
  tmp = WithdrawPaymentJob.perform_at((training.time + 1.minutes).to_f,
                                      { :client_id => training.client_id,
                                        :user_id => training.user_id,
                                        :time => training.time + 1.minutes,
                                        :price => training.price,
                                        :training_id => training.id
                                      }.to_json)
  Job.new(GUID: tmp, training_id: training.id).save!
  end

  def delete_background_proc(training_id)
    job = Job.where(training_id: training_id)[0]
    Sidekiq::Status.cancel job.GUID
    job.delete
  end
end
