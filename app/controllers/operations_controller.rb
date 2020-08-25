class OperationsController < ApplicationController
  before_action :set_operation, only: :destroy

  def index
    @operation = Operation.all
  end

  def new
    @operation = Operation.new
  end

  def create
    @operation = Operation.new(operation_params)

    if @operation.save
      redirect_to operations_path
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
end
