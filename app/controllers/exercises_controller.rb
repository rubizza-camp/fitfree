class ExercisesController < ApplicationController
  include TypeListConcern
  before_action :find_exercise, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  @@count = 1

  def index
    @exercises = Exercise.all.map do |exe|    # It's bad naming
      {
          :name => (ExerciseType.find_by(id: exe.exercise_type_id)).name,
          :exercise => exe
      }
    end
  end

  def new
    create(params['id'])
  end

  def create(id)
    kit_id = id
    @exercise = Exercise.new(:exercise_type_id => 1, :kit_id => kit_id, :user_id => current_user.id, :repeats => 1, :approach => 1)
    if @exercise.save
      redirect_to edit_exercise_path(@exercise)
    else
      render 'new'
    end
  end

  def edit
    @count = @@count
    @ex_id = @exercise.id
    @types = types_list
    render layout: false
    @@count += 1
  end

  def update
    if @exercise.update(exercise_params)
      @name = (ExerciseType.find_by(id: @exercise.exercise_type_id)).name
      render plain: "#{@name}"+ " | " + "повторений: " + "#{@exercise.repeats}"+ "," + "подходов: " "#{@exercise.approach}"
    else
      @count = @@count
      @ex_id = @exercise.id
      @types = types_list
      render 'edit', layout: false
      @@count += 1
    end
  end

  def destroy
    @exercise.destroy
    redirect_to exercises_path
  end

  private
  def find_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:exercise_type_id, :kit_id, :repeats, :approach)
  end
end
