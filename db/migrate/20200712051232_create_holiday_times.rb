class CreateHolidayTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :holiday_times do |t|
      t.string :holiday_division,      null: false
      t.text :holiday_reason,         null: false
      t.references  :user,  index: true, foreign_key: true
      t.timestamps
    end
  end
end
