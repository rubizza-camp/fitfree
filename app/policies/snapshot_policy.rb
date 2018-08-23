class SnapshotPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    current_user
  end

  def create?
    @current_user
  end

  def new?
    create?
  end

  def show?
    @current_user
  end

end
