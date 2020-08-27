class CreateMaintenancesOperations < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenances_operations do |t|
      t.references :operation, null: false, foreign_key: true
      t.references :maintenance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
