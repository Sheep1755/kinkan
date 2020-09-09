class Timecard < ApplicationRecord
  belongs_to :user

  # def set_date
  #   start_time.strftime("%H:%M:%S")
  # end  
end
