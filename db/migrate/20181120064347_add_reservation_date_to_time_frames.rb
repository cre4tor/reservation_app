class AddReservationDateToTimeFrames < ActiveRecord::Migration[5.1]
  def change
    add_column :time_frames, :reservation_date, :date
  end
end
