class MetricPolicy < ApplicationPolicy
  def index?
    user
  end
end
