# frozen_string_literal: true

# This class has reservation function of financial_planner side
class TimeFramesController < ApplicationController
  before_action :logged_in_financial_planner, only: %i[new create]

  def new
    @time_frame = TimeFrame.new

    # 配列を生成
    @weekday_start_time_array = []
    @saturday_start_time_array = []

    # 平日の開始時刻範囲を設定[10:00~17:30]
    @weekday_start_time_array = Array.new(16) { |i| Tod::TimeOfDay.parse('10:00') + 30.minutes * i }
    # 土曜日の開始時刻範囲を設定[11:00~14:30]
    @saturday_start_time_array = Array.new(8) { |i| Tod::TimeOfDay.parse('11:00') + 30.minutes * i }
  end

  def create
    financial_planner = current_user.financial_planner
    time_frame = financial_planner.time_frames.new(time_frame_params)
    if time_frame.save
      redirect_to @current_user, flash: { success: 'Reservation frame set completed!' }
    else
      redirect_to new_time_frame_path, flash: { danger: 'Reservation failed...' }
    end
  end

  def logged_in_financial_planner
    redirect_to login_url, flash: { danger: 'Please log in' } unless logged_in?
    redirect_to current_user, flash: { danger: 'Permission denied' } unless current_user.financial_planner?
  end

  private

  def end_time
    (Time.parse(params[:time_frame][:start_time]) + 30.minutes).strftime('%H:%M:%S')
  end

  def time_frame_params
    params.require(:time_frame).permit(:reservation_date, :start_time).merge(end_time: end_time)
  end
end
