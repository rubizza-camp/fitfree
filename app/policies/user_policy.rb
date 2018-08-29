class UserPolicy < ApplicationPolicy
  def index?
    user_is_admin?
  end

  def show?
    user_is_admin?
  end

  def create?
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

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.is_a?(Administrator) && !user.superadmin?
        scope.all
      else
        scope.none
      end
    end
  end

  private

  def user_is_admin?
    user.is_a?(Administrator) && !user.superadmin?
  end
end
