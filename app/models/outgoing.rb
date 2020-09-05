class Outgoing < Transaction
  validates :amount, numericality: { less_than_or_equal_to: 0 }
end
