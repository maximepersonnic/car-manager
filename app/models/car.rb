class Car < ApplicationRecord
  belongs_to :car_model
  has_many :transactions
  has_many :incomings
  has_many :outgoings
  has_many :mileages
  has_many :maintenances
  has_one :mileage, -> { order created_at: :desc}

  validates :registration, :date_of_registration, presence: true

  delegate :brand_name, to: :car_model
  delegate :name, to: :car_model, prefix: true
  delegate :value, to: :mileage, prefix: true, allow_nil: true
end
