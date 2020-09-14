class RemoveTimecardFromHolidays < ActiveRecord::Migration[6.0]
  def change
    remove_reference :holidays, :timecard, null: false, foreign_key: true
  end
end
