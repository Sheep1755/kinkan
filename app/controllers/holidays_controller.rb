class HolidaysController < ApplicationController
  def new
    @holiday = Holiday.new
  end
  
  def create
    @holiday = Holiday.new(holidays_params)
    if @holiday.save
      redirect_to root_path
    else
      render :new
    end    
  end    
  
  private
  def holidays_params
    params.require(:holiday).permit(:holiday_division, :holiday_reason, :status).merge(user_id: current_user.id)
  end
end