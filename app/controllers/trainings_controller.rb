class TrainingsController < ApplicationController
  require 'sidekiq/api'
  include ClientListConcern
  before_action :find_training, only: [:show, :edit, :update, :cancel, :destroy]
  before_action :authenticate_user!
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def index
    @training = Training.where(user_id: current_user.id).map do |training|
      {
          :name => Client.find_by(id: training.client_id).first_name + ' ' + Client.find_by(id: training.client_id).second_name,
          :training => training
      }
    end
  end

  def show
    @name = Client.find_by(id: @training.client_id).first_name + ' ' + Client.find_by(id: @training.client_id).second_name
    @sets = Kit.where(training_id: @training.id, user_id: current_user.id).map do |kit|
      {
          :exercises => Exercise.where(kit_id: kit.id, user_id: current_user.id),
          :kit => kit
      }
    end
    @sets.each do |kit|
     kit1 = kit[:exercises].map do |exe|
        { name: ExerciseType.find_by(id: exe.exercise_type_id).name, exe: exe }
     end
      kit[:exercises] = kit1
    end
  end

  def new
    @training = current_user.trainings.build
    @list = client_list(current_user)
  end

  def create
    @training = current_user.trainings.build(training_params)
    if @training.save
      create_background_proc(@training.id) unless @training.status == :complete
      redirect_to edit_training_path(@training)
    else
      render 'new'
    end
  end

  def edit
    @list = client_list(current_user)
    @name = Client.find_by(id: @training.client_id).first_name + ' ' + Client.find_by(id: @training.client_id).second_name
    @sets = Kit.where(training_id: @training.id, user_id: current_user.id).map do |kit|
      {
          :exercises => Exercise.where(kit_id: kit.id, user_id: current_user.id),
          :kit => kit
      }
    end
    @sets.each do |kit|
      kit1 = kit[:exercises].map do |exe|
        { name: ExerciseType.find_by(id: exe.exercise_type_id).name, exe: exe }
      end
      kit[:exercises] = kit1
    end
  end

  def update
    @training.update(status: :planned)
    if @training.update(training_params)
      if @training.status == :planned
        delete_background_proc(@training.id)
        create_background_proc(@training.id)
      end
      @training.status = :complete if @training.time.to_f < DateTime.now.to_f
      @training.save!
      redirect_to training_path
    else
      render 'edit'
    end
  end

  def cancel
    @training.update(status: :canceled)
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
  training = Training.find(training_id)
  tmp = WithdrawPaymentJob.perform_at((training.time + 2.hours).to_f,
                                        { :client_id => training.client_id,
                                          :user_id => training.user_id,
                                          :time => training.time + 2.hours,
                                          :price => training.price,
                                          :training_id => training.id
                                        }.to_json)
  job = Job.new(GUID: tmp, training_id: training.id)
  job.save!
  end

  def delete_background_proc(training_id)
      job = Job.where(training_id: training_id)[0]
      Sidekiq::Status.cancel job.GUID
      job.delete
  end
end
