class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.integer :user_id, :null => false
      t.integer :account_id, :null => false

      t.timestamps
    end
    add_index :clients, :user_id
    add_index :clients, :account_id
  end
end
