class OperationsController < ApplicationController
  before_action :set_operation, only: :destroy
  before_action :set_car, only: [:index, :new, :create]
  before_action :set_breadcrumbs, only: [:index, :new, :create]

  def index
    @operations = policy_scope(Operation)
  end

  def new
    @operation = Operation.new
    authorize @operation

    @breadcrumbs << [ 'New operation' ]
  end

  def create
    @operation = current_user.operations.new(operation_params)
    authorize @operation

    if @operation.save
      redirect_to car_operations_path(@car)
    else
      render :new
    end
  end

  def destroy
    @operation.destroy

    redirect_to operations_path
  end

  private

  def operation_params
    params
      .require(:operation)
      .permit(
        :title
      )
  end

  def set_operation
    @operation = Operation.find(params[:id])
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_breadcrumbs
    @breadcrumbs = []
    @breadcrumbs << [ 'Cars', root_path ]
    @breadcrumbs << [ @car.registration ]
    @breadcrumbs << [ 'Maintenances', car_maintenances_path(@car) ]
    @breadcrumbs << [ 'Operations', car_operations_path(@car) ]
  end
end
