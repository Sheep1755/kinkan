class CreateHolidays < ActiveRecord::Migration[6.0]
  def change
    create_table :holidays do |t|
      t.string :holiday_division
      t.text :holiday_reason        
      t.references  :user,  index: true, foreign_key: true
      t.references  :timecard, index: true, foreign_key: true
      t.timestamps
    end
  end
end
