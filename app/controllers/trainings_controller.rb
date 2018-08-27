class TrainingsController < ApplicationController
  require 'sidekiq/api'
  include ClientListConcern
  include TrainingPlanConcern
  before_action :find_training, only: %i[show edit update cancel destroy]
  before_action :authenticate_user!
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def index
    @training = Training.where(user_id: current_user.id).map do |training|
      {
        name:     Client.find_by(id: training.client_id).full_name,
        training: training
      }
    end
  end

  def show
    @name = Client.find_by(id: @training.client_id).full_name
    @sets = kit_constructor
  end

  def new
    @training = current_user.trainings.build
    @list = client_list(current_user)
    date = params[:date][0...10]
    @day = date[8].to_i == 0 ? date[9] : date[8..9]
    @month = date[5].to_i == 0 ? date[6] : date[5..6]
    @year = date[0..3]
  end

  def create
    @training = current_user.trainings.build(training_params)
    if @training.save
      TrainingsHelper::BackgroundProccess.create_background_proc(@training.id) unless @training.status == :complete
      redirect_to edit_training_path(@training)
    else
      render 'new'
    end
  end

  def edit
    @list = client_list(current_user)
    @name = Client.find_by(id: @training.client_id).full_name
    @sets = kit_constructor
  end

  def update
    @training.update(status: :planned)
    if @training.update(training_params)
      if @training.status == :planned
        TrainingsHelper::BackgroundProccess.delete_background_proc(@training.id)
        TrainingsHelper::BackgroundProccess.create_background_proc(@training.id)
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
    TrainingsHelper::BackgroundProccess.delete_background_proc(@training.id)
    @training.destroy
    redirect_to calendar_index_path
  end

  private

  def find_training
    @training = Training.find(params[:id])
  end

  def training_params
    params[:training][:price] = Client.find(params[:training][:client_id]).price if params[:training][:price].empty?
    params.require(:training).slice(:time, :price, :description, :client_id, :status, :cancel,
                                    'time(1i)', 'time(2i)', 'time(3i)', 'time(4i)', 'time(5i)').permit!
  end

  def kit_constructor
    sets = Kit.where(training_id: @training.id, user_id: current_user.id).map do |kit|
      {
        exercises: Exercise.where(kit_id: kit.id, user_id: current_user.id),
        kit:       kit
      }
    end
    sets.each do |kit|
      tmp_kit = kit[:exercises].map do |exe|
        {name: ExerciseType.find_by(id: exe.exercise_type_id).name, exe: exe}
      end
      kit[:exercises] = tmp_kit
    end
    sets
  end
end
