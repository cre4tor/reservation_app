class TimeFramesController < ApplicationController
  before_action :logged_in_financial_planner, only[:create]

  def new
    @time_frame = TimeFrame.new

    #配列を生成
    @weekday_start_time_array = []
    @saturday_start_time_array = []

    #平日の開始時刻範囲を設定[10:00~17:30]
    @weekday_start_time_array = 16.times.map.each_with_index {|i| Time.parse("10:00") + 30.minutes * i}
    #土曜日の開始時刻範囲を設定[11:00~14:30]
    @saturday_start_time_array = 8.times.map.each_with_index {|i| Time.parse("11:00") + 30.minutes * i}
  end

  def create
    @time_frame = @financial_planner.time_frames.build(time_frame_params)
    if @time_frame.save
      flash[:success] = "Reservation success!"
      redirect_to @current_user
    else
      flash[:danger] = "Reservation failed..."
      render 'new'
    end
  end

  private

    def time_frame_params
      params.require(:time_frame).permit(:reservation_date, :start_time, :end_time)
    end

    def logged_in_financial_plannner
      unless logged_in?
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
      unless financial_plannner?
        flash[:danger] = "Permission denied"
        redirect_to @current_user
      end
    end
end