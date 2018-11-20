class TimeFramesController < ApplicationController
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
end
