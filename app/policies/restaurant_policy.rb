class RestaurantPolicy < ApplicationPolicy

  def edit?
    update?
  end

  def update?
    owner_or_admin?
  end

  def show?
    true
  end

  def destroy?
    owner_or_admin?
  end

  def new?
    create?
  end

  def create?
    true
  end

  def owner_or_admin?
    user.admin? || record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
