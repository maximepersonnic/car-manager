class MaintenancesController < ApplicationController
  before_action :set_car, only: [:index, :new, :create]
  before_action :set_maintenance, only: :destroy
  before_action :skip_policy_scope, only: :index

  def index
    @maintenances = @car.maintenances

    authorize @car, :maintenances_index?
  end

  def new
    @maintenance = Maintenance.new
    @maintenance.car = @car
    authorize @maintenance
  end

  def create
    @maintenance = Maintenance.new(maintenance_params)
    @maintenance.car = @car
    authorize @maintenance

    @maintenance.mileage.car = @car
    @maintenance.mileage.statement_date = maintenance_params[:date]

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
        operation_ids: [],
        mileage_attributes: :value
      )
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_maintenance
    @maintenance = Maintenance.find(params[:id])
    authorize @maintenance
  end
end
