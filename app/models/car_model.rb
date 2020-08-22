class CarModel < ApplicationRecord
  belongs_to :brand

  delegate :name, to: :brand, prefix: true
end
