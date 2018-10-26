class CreateFinancialplanners < ActiveRecord::Migration[5.1]
  def change
    create_table :financialplanners do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :financialplanners, :user_id
  end
end
