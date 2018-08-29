class ClientPolicy < ApplicationPolicy
  def index?
    user
  end

  def stats?
    record.user == user
  end

  def diary?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
