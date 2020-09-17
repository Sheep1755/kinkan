class WorktimesController < ApplicationController
  before_action :move_to_index, except: [:index]
  
  def index
  end

  def create  
    require 'date'
    @time_card = Timecard.new(timecard_params)
    case params[:commit]
      when "出勤" ; @time_card.start_time = Time.now
      when "退勤" ; @time_card.end_time = Time.now
    end
    
    @time_card.save

    s_time = Timecard.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day, user_id: current_user.id).first
    e_time = Timecard.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day, user_id: current_user.id).last
    regular_time = Time.local(2000,01,01,18,0,0)
    working_time = Time.local(2000,01,01,8,0,0)
    no_time = Time.local(2000,01,01,0,0,0)
  
    
    if s_time && e_time.present? && e_time.end_time? && Time.at(e_time.end_time.to_i) > regular_time
      sum_time = Time.at(e_time.end_time.to_i) - Time.at(s_time.start_time.to_i) - 10.hours
      @time_card.total_time = Time.at(sum_time)
    elsif s_time && e_time.present? && e_time.end_time?
      sum_time = Time.at(e_time.end_time.to_i) - Time.at(s_time.start_time.to_i) - 9.hours
      @time_card.total_time = Time.at(sum_time)
    else
    
    end

    @time_card.save

  
    if s_time && e_time.present? && e_time.end_time? && Time.at(@time_card.total_time.to_i) > working_time
      a_time = Time.at(@time_card.total_time.to_i) - working_time
      @time_card.lost_time = Time.at(a_time.to_i) - 9.hours
    elsif s_time && e_time.present? && e_time.end_time? && Time.at(e_time.total_time.to_i) < working_time
      @time_card.lost_time = no_time
    else

    end

    @time_card.save 

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
    @time_card = Timecard.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month, user_id: current_user.id)
    @holiday = Holiday.where(status: DateTime.now.beginning_of_month..DateTime.now.end_of_month, user_id: current_user.id)
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

  

