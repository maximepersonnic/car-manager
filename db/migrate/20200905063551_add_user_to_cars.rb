class AddUserToCars < ActiveRecord::Migration[6.0]
  def change
    add_reference :cars, :user, foreign_key: true
  end
end
