class AdministratorPolicy < ApplicationPolicy
  def index?
    admin_is_superadmin?
  end

  def create?
    admin_is_superadmin?
  end

  def reset_password?
    admin_is_superadmin?
  end

  def block?
    admin_is_superadmin?
  end

  def unblock?
    admin_is_superadmin?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.superadmin?
        scope.all
      else
        scope.none
      end
    end
  end

  private

  def admin_is_superadmin?
    user.superadmin?
  end
end
