class CreateTimeFrames < ActiveRecord::Migration[5.1]
  def change
    create_table :time_frames do |t|
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
