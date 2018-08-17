class TrainingsController < ApplicationController
  include ClientListConcern
  before_action :find_training, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

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
    if @training.update(training_params)
      redirect_to training_path
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
    params.require(:training).permit(:time, :price,  :description, :client_id, :status)
  end
end
