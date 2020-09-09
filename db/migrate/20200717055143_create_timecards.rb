class CreateTimecards < ActiveRecord::Migration[6.0]
  def change
    create_table :timecards do |t|
      t.time :start_time     
      t.time :end_time
      t.time :total_time
      t.time :lost_time
      t.references  :user,  index: true, foreign_key: true
      t.timestamps
    end
  end
end
