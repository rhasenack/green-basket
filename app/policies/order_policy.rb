class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    user.consumer?
  end

  def index?
    true
  end

  def accept?
    true
  end

  def decline?
    true
  end

  def cancel?
    true
  end
end
