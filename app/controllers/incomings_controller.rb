class IncomingsController < TransactionsController
  def new
    @incoming = Incoming.new
  end

  def create
    @incoming = @car.incomings.new(transaction_params(:incoming))

    if @incoming.save
      redirect_to car_transactions_path(@car)
    else
      render :new
    end
  end
end
