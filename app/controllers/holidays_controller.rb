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
  
  def show
    @day = Date.today
    start_date = Date::new(@day.year,@day.month, 1)
    end_date = start_date >> 1
    end_date = end_date - 1
    @start_date = start_date
    @end_date = end_date
    year_name = start_date.year
    @year_name = year_name
    month_name = start_date.month
    @month_name =  month_name
    @holiday = Holiday.where(status: DateTime.now.beginning_of_month..DateTime.now.end_of_month, user_id: current_user.id)
  end

  def destroy
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