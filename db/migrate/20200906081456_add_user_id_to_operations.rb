class AddUserIdToOperations < ActiveRecord::Migration[6.0]
  def change
    add_reference :operations, :user, foreign_key: true
  end
end
