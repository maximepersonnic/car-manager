class TransactionsController < ApplicationController
  before_action :set_car, only: [:index, :new, :create]
  before_action :set_transaction, only: :destroy

  before_action :set_breadcrumbs, only: [:index, :new, :create]

  before_action :skip_policy_scope, only: :index

  def index
    @transactions = @car.transactions
    authorize @car, :transactions_index?
  end

  def destroy
    @transaction.destroy

    redirect_to car_transactions_path(@transaction.car)
  end

  private

  def transaction_params(type)
    initial_params = params
      .require(type)
      .permit(
        :name,
        :description,
        :date,
        :amount
      )

    initial_params[:amount] = (- initial_params[:amount].to_i) if type == :outgoing
    initial_params
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
    authorize @transaction, policy_class: TransactionPolicy
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_breadcrumbs
    @breadcrumbs = []
    @breadcrumbs << [ 'Cars', root_path ]
    @breadcrumbs << [ @car.registration ]
    @breadcrumbs << [ 'Transactions', car_transactions_path(@car) ]
  end
end
