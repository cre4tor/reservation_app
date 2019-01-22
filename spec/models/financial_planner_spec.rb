# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FinancialPlanner, type: :model do
  # FinancialPlanner 依存関係
  describe 'financial_planner associations' do
    # association type
    describe 'belongs_to' do
      it { should belong_to(:user) }
    end
    describe 'has_many' do
      it { should have_many(:time_frames).dependent(:destroy) }
    end
  end
end
