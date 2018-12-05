class TimeFramesController < ApplicationController
  before_action :logged_in_financial_planner, only: [:new, :create]

  def new
    @time_frame = TimeFrame.new

    #配列を生成
    @weekday_start_time_array = []
    @saturday_start_time_array = []

    #平日の開始時刻範囲を設定[10:00~17:30]
    @weekday_start_time_array = 16.times.map.each_with_index {|i| Tod::TimeOfDay.parse("10:00") + 30.minutes * i}
    #土曜日の開始時刻範囲を設定[11:00~14:30]
    @saturday_start_time_array = 8.times.map.each_with_index {|i| Tod::TimeOfDay.parse("11:00") + 30.minutes * i}
  end

  def create
    @financial_planner = FinancialPlanner.find_by(id: @current_user)
    @time_frame = @financial_planner.time_frames.new(time_frame_params)
    @reservation = @time_frame.build_reservation
    if @reservation.save
      flash[:success] = "Reservation SUCCESS!"
      redirect_to current_user
    else
      flash[:danger] = "Reservation failed..."
      redirect_to new_time_frame_path
    end
  end

  def logged_in_financial_planner
    unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
    unless current_user.financial_planner?
      flash[:danger] = "Permission denied"
      redirect_to @current_user
    end
  end

  private

    def end_time
      Time.parse(params[:time_frame][:start_time]) + 30.minutes
    end

    def time_frame_params
      params.require(:time_frame).permit(:reservation_date, :start_time).merge(end_time: end_time)
    end

  end
