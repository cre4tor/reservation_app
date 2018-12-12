# frozen_string_literal: true

class AddFinancialPlannerIdToTimeFrames < ActiveRecord::Migration[5.1]
  def change
    add_column :time_frames, :financial_planner_id, :integer
    add_index :time_frames, :financial_planner_id
  end
end
