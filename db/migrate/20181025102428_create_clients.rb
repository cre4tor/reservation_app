# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :clients, :user_id, unique: true
  end
end
