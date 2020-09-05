class ChangeStatementDateToBeDateTimeInMileages < ActiveRecord::Migration[6.0]
  def up
    change_column :mileages, :statement_date, :datetime
  end

  def down
    change_column :mileages, :statement_date, :date
  end
end
