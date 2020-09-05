class MileagePolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    record.car.user == user
  end

  def edit?
    create?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
