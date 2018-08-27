class ClientPolicy < ApplicationPolicy
  def index?
    user
  end

  def stats?
    user
  end

  def destroy?
    record.user == user
  end
end
