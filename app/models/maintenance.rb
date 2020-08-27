class Maintenance < ApplicationRecord
  belongs_to :car
  belongs_to :mileage
  accepts_nested_attributes_for :mileage

  has_and_belongs_to_many :operations
end
