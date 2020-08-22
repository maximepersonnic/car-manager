class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :registration
      t.date :date_of_registration
      t.references :car_model, null: false, foreign_key: true

      t.timestamps
    end
  end
end
