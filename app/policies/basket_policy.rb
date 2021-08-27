class BasketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    user.restaurant?
  end

  def show?
    # record.user_id == user.id
    true
  end

  def favourites?
    true
  end
end
