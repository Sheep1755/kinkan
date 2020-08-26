class WorktimesController < ApplicationController
  before_action :move_to_index, except: [:index]
  
  def index
  end

  def show
    require 'date'
    day = Date.today
    start_date = Date::new(day.year,day.month, 1)
    end_date = start_date >> 1
    end_date = end_date - 1
    @start_date = start_date
    @end_date = end_date
    year_name = start_date.year
    @year_name = year_name
    month_name = start_date.month
    @month_name =  month_name
  end  

  def create
    @time_card = Timecard.new(timecard_params)
    case params[:commit]
      when "出勤" ; @time_card.start_time = Time.now
      when "退勤" ; @time_card.end_time = Time.now
    end
    if @time_card.save
      redirect_to root_path
    else
      render :index
    end  
  end
  
  private
  def timecard_params
    params.permit(:start_time, :end_time, :total_time, :lost_time).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

  

