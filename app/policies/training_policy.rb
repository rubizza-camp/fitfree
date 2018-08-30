class TrainingPolicy < ApplicationPolicy
  def index?
    user
  end

  def show?
    record.user == user
  end

  def update?
    record.user == user
  end

  def cancel?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
