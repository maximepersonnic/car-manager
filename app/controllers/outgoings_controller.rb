class OutgoingsController < TransactionsController
  def new
    @outgoing = Outgoing.new
  end

  def create
    @outgoing = @car.outgoings.new(transaction_params(:outgoing))

    if @outgoing.save
      redirect_to car_transactions_path(@car)
    else
      render :new
    end
  end
end
