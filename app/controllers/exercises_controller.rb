class ExercisesController < ApplicationController
  before_action :find_exercise, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def index
    @exercise = Exercise.all.map do |exe|
      {
          :name => (ExerciseType.find_by(id: exe.exercise_type_id)).name,
          :exercise => exe
      }
    end
  end

  def new
    @exercise = Exercise.new
    @types = []
    ExerciseType.all.each do |type|
      each = []
      each << type.name
      each << type.id
      @types << each
    end
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to exercises_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to exercises_path
    else
      render 'edit'
    end
  end

  def destroy
    @exercise.destroy
    redirect_to exercises_path
  end

  def new_exercise_form
    @exercise = Exercise.new
    @types = []
    ExerciseType.all.each do |type|
      each = []
      each << type.name
      each << type.id
      @types << each
    end
    render layout: false
  end

  private
  def find_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:exercise_type_id, :repeats, :approach)
  end
end
