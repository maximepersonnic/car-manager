class CreateMaintenances < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenances do |t|
      t.text :description
      t.date :date
      t.references :car, null: false, foreign_key: true
      t.references :mileage, null: false, foreign_key: true

      t.timestamps
    end
  end
end
