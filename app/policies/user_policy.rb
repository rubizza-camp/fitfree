class UserPolicy < ApplicationPolicy
  def index?
    user_is_admin?
  end

  def show?
    user_is_admin?
  end

  def reset_password?
    user_is_admin?
  end

  def block?
    user_is_admin?
  end

  def unblock?
    user_is_admin?
  end

  private

  def user_is_admin?
    user.is_a?(Administrator)
  end
end
