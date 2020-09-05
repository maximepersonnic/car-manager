class Transaction < ApplicationRecord
  belongs_to :car

  validates :name, :date, :amount, presence: true

  def incoming?
    type == "Incoming"
  end

  def outgoing?
    type == "Outgoing"
  end
end
