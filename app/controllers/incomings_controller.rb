class IncomingsController < TransactionsController
  def new
    @incoming = Incoming.new
    @incoming.car = @car
    authorize @incoming, policy_class: TransactionPolicy
  end

  def create
    @incoming = @car.incomings.new(transaction_params(:incoming))
    authorize @incoming, policy_class: TransactionPolicy

    if @incoming.save
      redirect_to car_transactions_path(@car)
    else
      render :new
    end
  end
end
