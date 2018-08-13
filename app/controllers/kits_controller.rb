class KitsController < ApplicationController
  before_action :find_kit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @kit = Kit.all.map do |kit|
      {
          :client => (Client.find_by(id: kit.client_id)).first_name + ' ' + (Client.find_by(id: kit.client_id)).second_name,
          :exercise => (ExerciseType.find_by(id: (Exercise.find_by(id: kit.exercise_id)).exercise_type_id)).name,
          :kit => kit
      }
    end
  end

  def show
  end

  def new
    @kit = Kit.new
    @exercise = []
    @client = []
    @exercises = Exercise.all.map do |exe|
      {
          :name => (ExerciseType.find_by(id: exe.exercise_type_id)).name,
          :exercise => exe
      }
    end
    @exercises.each do |exe|
      mass = []
      mass << exe[:name] + ' ' + exe[:exercise].repeats.to_s
      mass << exe[:exercise].id
      @exercise << mass
    end
    Client.all.each do |client|
      mass = []
      mass << client.first_name + ' ' + client.second_name
      mass << client.id
      @client << mass
    end
  end

  def create
    @kit = Kit.new(kit_params)
    if @kit.save
      redirect_to kits_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @kit.update(kit_params)
      redirect_to kit_path
    else
      render 'edit'
    end
  end

  def destroy
    @kit.destroy
    redirect_to kits_path
  end


  private
  def find_kit
    @kit = Kit.find(params[:id])
  end

  def kit_params
    params.require(:kit).permit(:title, :description, :client_id, :exercise_id, :repeats)
  end


end
