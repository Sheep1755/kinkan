class AddHolidayDateToHolidays < ActiveRecord::Migration[6.0]
  def change
    add_column :holidays, :status, :date
  end
end
