class Transaction < ApplicationRecord
  belongs_to :car

  def incoming?
    type == "Incoming"
  end

  def outgoing?
    type == "Outgoing"
  end
end

