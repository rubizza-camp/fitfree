class TrainingsController < ApplicationController
  include ClientListConcern
  before_action :find_training, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @training = Training.where(user_id: current_user)
  end

  def show; end

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
  end

  def update
    if @training.update(training_params)
      redirect_to calendar_index_path
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
    params.require(:training).permit(:title, :time, :price,  :description, :client_id, :status)
  end
end
