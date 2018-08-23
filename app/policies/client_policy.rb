class ClientPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user
  end

  def show?
    @current_user
  end

  def new?
    create?
  end

  def create?
    @current_user
  end

  def edit?
    update?
  end

  def stats?
    @current_user
  end

  def update?
    @current_user
  end

  def destroy?
    @current_user
  end
end
