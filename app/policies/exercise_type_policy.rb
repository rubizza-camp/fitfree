class ExerciseTypePolicy < ApplicationPolicy
  def index?
    user
  end
end
