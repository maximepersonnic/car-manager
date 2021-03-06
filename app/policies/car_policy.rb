class CarPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    create?
  end

  def update?
    create?
  end

  def transactions_index?
    children_index?
  end

  def maintenances_index?
    children_index?
  end

  def mileages_index?
    children_index?
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  private

  def children_index?
    record.user == user
  end
end
