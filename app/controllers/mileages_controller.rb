class MileagesController < ApplicationController
  before_action :set_car, only: [:index, :new, :create, :edit]
  before_action :set_mileage, only: [:edit, :update, :destroy]
  before_action :set_breadcrumbs, only: [:index, :new, :edit, :create]

  before_action :skip_policy_scope, only: :index

  def index
    @mileages = @car.mileages
    authorize @car, :mileages_index?

    @mileage = Mileage.new
    @mileage.car = @car
  end

  def new
    @mileage = Mileage.new
    @mileage.car = @car
    authorize @mileage

    @breadcrumbs << [ 'New mileage' ]
  end

  def create
    @mileage = Mileage.new(mileage_params)
    @mileage.car = @car
    authorize @mileage

    @breadcrumbs << [ 'New mileage' ]

    @mileage.statement_date = Time.zone.now

    if @mileage.save
      redirect_to car_mileages_path(@car)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @mileage.update(mileage_params)
      redirect_to car_mileages_path(@mileage.car)
    else
      render :edit
    end
  end

  def destroy
    @mileage.destroy

    redirect_to car_mileages_path(@mileage.car)
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

  def set_mileage
    @mileage = Mileage.find(params[:id])
    authorize @mileage
  end

  def set_breadcrumbs
    @breadcrumbs = []
    @breadcrumbs << [ 'Cars', root_path ]
    @breadcrumbs << [ @car.registration ]
    @breadcrumbs << [ 'Mileages', car_mileages_path(@car) ]
  end
end
