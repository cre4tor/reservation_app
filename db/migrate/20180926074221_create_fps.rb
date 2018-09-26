class CreateFps < ActiveRecord::Migration[5.1]
  def change
    create_table :fps do |t|
      t.string :first_name
      t.string :last_name
      t.integer :user_id
      t.integer :account_id

      t.timestamps
    end
    add_index :fps, :user_id
    add_index :fps, :account_id
  end
end
