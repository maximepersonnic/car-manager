class CarPolicy < ApplicationPolicy
  def transactions_index?
    children_index?
  end

  def maintenances_index?
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
