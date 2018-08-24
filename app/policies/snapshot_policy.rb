class SnapshotPolicy < ApplicationPolicy
  def index?
    user
  end
end
