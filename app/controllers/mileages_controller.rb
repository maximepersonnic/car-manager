class MileagesController < ApplicationController
  before_action :set_car, only: [:new, :create]

  def new
    @mileage = Mileage.new
    @mileage.car = @car
    authorize @mileage
  end

  def create
    @mileage = Mileage.new(mileage_params)
    @mileage.car = @car
    authorize @mileage

    @mileage.statement_date = Time.zone.now

    if @mileage.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def mileage_params
    params
      .require(:mileage)
      .permit(
        :value
      )
  end

  def set_car
    @car = Car.find(params[:car_id])
  end
end
