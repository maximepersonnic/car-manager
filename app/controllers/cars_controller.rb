class CarsController < ApplicationController
  def index
    @cars = policy_scope(Car)
  end
end
