# frozen_string_literal: true

class AddTitleToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :title, :string
  end
end
