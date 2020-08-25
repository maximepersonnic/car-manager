class MaintenancesController < ApplicationController
  before_action :set_car, only: [:index, :new, :create]
  before_action :set_maintenance, only: :destroy

  def index
    @maintenances = @car.maintenances
  end

  def new
    @maintenance = Maintenance.new
  end

  def create
    @maintenance = Maintenance.new(maintenance_params)
    @maintenance.car = @car
    @maintenance.mileage.car = @car

    if @maintenance.save
      redirect_to car_maintenances_path(@car)
    else
      render :new
    end
  end

  def destroy
    @maintenance.destroy

    redirect_to car_maintenances_path(@maintenance.car)
  end

  private

  def maintenance_params
    params
      .require(:maintenance)
      .permit(
        :description,
        :date,
        mileage_attributes: :value
      )
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_maintenance
    @maintenance = Maintenance.find(params[:id])
  end
end
