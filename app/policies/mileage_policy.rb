class MileagePolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    record.car.user == user
  end
end
