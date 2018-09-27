class CreateFps < ActiveRecord::Migration[5.1]
  def change
    create_table :fps do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.integer :user_id, :null => false
      t.integer :account_id, :null => false

      t.timestamps
    end
    add_index :fps, :user_id
    add_index :fps, :account_id
  end
end
