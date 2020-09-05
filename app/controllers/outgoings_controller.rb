class OutgoingsController < TransactionsController
  def new
    @outgoing = Outgoing.new
    @outgoing.car = @car
    authorize @outgoing, policy_class: TransactionPolicy
  end

  def create
    @outgoing = @car.outgoings.new(transaction_params(:outgoing))
    authorize @outgoing, policy_class: TransactionPolicy

    if @outgoing.save
      redirect_to car_transactions_path(@car)
    else
      render :new
    end
  end
end
