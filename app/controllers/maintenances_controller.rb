class MaintenancesController < ApplicationController
  before_action :set_car, only: [:index, :new, :create, :edit, :update]
  before_action :set_maintenance, only: [:edit, :update, :destroy]
  before_action :set_breadcrumbs, only: [:index, :new, :create, :edit, :update]
  before_action :set_operations, only: [:new, :edit]

  before_action :skip_policy_scope, only: :index

  def index
    @maintenances = @car.maintenances

    authorize @car, :maintenances_index?
  end

  def new
    @maintenance = Maintenance.new
    @maintenance.car = @car
    authorize @maintenance

    @mileage = Mileage.new

    @breadcrumbs << [ 'New maintenance' ]
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

  def edit
    @breadcrumbs << [ 'Edit maintenance' ]
  end

  def update
    @mileage = @maintenance.mileage

    if @maintenance.update(maintenance_params)
      redirect_to car_maintenances_path(@car)
    else
      render :edit
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
        mileage_attributes: [:id, :value]
      )
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_maintenance
    @maintenance = Maintenance.find(params[:id])
    authorize @maintenance
  end

  def set_breadcrumbs
    @breadcrumbs = []
    @breadcrumbs << [ 'Cars', root_path ]
    @breadcrumbs << [ @car.registration ]
    @breadcrumbs << [ 'Maintenances', car_maintenances_path(@car) ]
  end

  def set_operations
    @operations = current_user.operations
  end
end
