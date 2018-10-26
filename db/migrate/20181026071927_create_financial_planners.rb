class CreateFinancialPlanners < ActiveRecord::Migration[5.1]
  def change
    create_table :financial_planners do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :financial_planners, :user_id
  end
end
