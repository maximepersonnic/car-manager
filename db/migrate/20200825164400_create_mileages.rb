class CreateMileages < ActiveRecord::Migration[6.0]
  def change
    create_table :mileages do |t|
      t.integer :value
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
