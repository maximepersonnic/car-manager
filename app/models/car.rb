class Car < ApplicationRecord
  belongs_to :car_model

  validates :registration, :date_of_registration, presence: true

  delegate :brand_name, to: :car_model
  delegate :name, to: :car_model, prefix: true
end
