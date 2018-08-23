class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_admin
  end

  def show?
    @current_admin
  end

  def edit?
    update?
  end

  def update?
    @current_admin
  end

  def destroy?
    @current_admin
  end

end
