class AddDateToMileages < ActiveRecord::Migration[6.0]
  def change
    add_column :mileages, :statement_date, :date
  end
end
