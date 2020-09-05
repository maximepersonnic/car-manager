class CarsController < ApplicationController
  before_action :set_car, only: [:edit, :update]

  before_action :set_breadcrumbs, only: [:index, :new, :create, :edit, :update]

  def index
    @cars = policy_scope(Car)
  end

  def new
    @car = Car.new
    authorize @car

    @breadcrumbs << [ 'New car' ]
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    authorize @car

    if @car.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @breadcrumbs << [ 'Edit car' ]
  end

  def update
    if @car.update(car_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_breadcrumbs
    @breadcrumbs = []
    @breadcrumbs << [ 'Cars', root_path ]
  end

  def set_car
    @car = Car.find(params[:id])
    authorize @car
  end

  def car_params
    params
      .require(:car)
      .permit(
        :registration,
        :date_of_registration,
        :car_model_id
      )
  end
end
