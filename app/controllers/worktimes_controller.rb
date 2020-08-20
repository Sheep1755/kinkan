class WorktimesController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    @timecard = Timecard.new
  end

  def show
    @timecard = Timecard.new(timecard_params)
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

  def new
    @timecard = Timecard.new
  end  

  def create
    Timecard.create(timecard_params)
    require 'date'
    @timecard = DateTime.now
    puts(@timecard.hour,":",@timecard.min,":",@timecard.sec,":\n")
  end
  
  private
  def timecard_params
    params.permit(:start_time, :end_time)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

  

