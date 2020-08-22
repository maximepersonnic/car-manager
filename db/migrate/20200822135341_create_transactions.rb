class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.date :date
      t.float :amount
      t.text :description
      t.references :car, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
