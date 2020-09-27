class HolidaysController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end  
  
  def new
    @holiday = Holiday.new
  end
  
  def create
    @holiday = Holiday.new(holidays_params)
    if @holiday.save
      flash[:success] = "申請が完了しました"
      redirect_to root_path
    else
      render :new
    end    
  end    
  
  private
  def holidays_params
    params.require(:holiday).permit(:holiday_division, :holiday_reason, :status).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      flash[:roginalert] = "ログインしてください"
      redirect_to root_path
    end
  end
end