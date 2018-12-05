class RemoveTitleFromReservations < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservations, :title, :string
  end
end
