class TransactionsController < ApplicationController
  before_action :set_car, only: [:index, :new, :create]
  before_action :set_transaction, only: :destroy

  def index
    @transactions = @car.transactions

    incomings_sum = @car.incomings.sum(:amount)
    outgoings_sum = @car.outgoings.sum(:amount)
    @investment_result = incomings_sum - outgoings_sum
  end

  def destroy
    @transaction.destroy

    redirect_to car_transactions_path(@transaction.car)
  end

  private

  def transaction_params(type)
    params
      .require(type)
      .permit(
        :name,
        :description,
        :date,
        :amount
      )
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def set_car
    @car = Car.find(params[:car_id])
  end
end
