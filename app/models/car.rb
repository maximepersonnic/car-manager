class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :user
  has_many :transactions, -> { order date: :desc}
  has_many :incomings
  has_many :outgoings
  has_many :mileages, -> { order statement_date: :desc}
  has_many :maintenances, -> { order date: :desc}
  has_one :mileage, -> { order statement_date: :desc}

  validates :registration, :date_of_registration, presence: true

  delegate :brand_name, to: :car_model
  delegate :name, to: :car_model, prefix: true
  delegate :value, to: :mileage, prefix: true, allow_nil: true

  def investment_result
    transactions.sum(:amount).round(2)
  end
end
