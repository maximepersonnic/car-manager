class TransactionPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    record.car.user == user
  end

  def destroy?
    create?
  end
end
