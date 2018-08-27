class UserPolicy < ApplicationPolicy
  def index?
    user.is_a?(Administrator)
  end

  def show?
    user.is_a?(Administrator)
  end
end
