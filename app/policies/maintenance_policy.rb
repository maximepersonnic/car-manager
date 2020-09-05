class MaintenancePolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    record.car.user == user
  end

  def destroy?
    create?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
