# frozen_string_literal: true

class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :client_id
      t.integer :time_frame_id

      t.timestamps
    end
    add_index :reservations, :client_id
    add_index :reservations, :time_frame_id
  end
end
