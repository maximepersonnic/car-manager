class Mileage < ApplicationRecord
  belongs_to :car

  validates :value, numericality: true
end
