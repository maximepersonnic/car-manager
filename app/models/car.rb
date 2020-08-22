class Car < ApplicationRecord
  belongs_to :car_model
  has_many :transactions
  has_many :incomings
  has_many :outgoings

  validates :registration, :date_of_registration, presence: true

  delegate :brand_name, to: :car_model
  delegate :name, to: :car_model, prefix: true
end
