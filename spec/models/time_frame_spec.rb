# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TimeFrame, type: :model do
  # Reservation 依存関係
  describe 'client associations' do
    # association targets
    context 'financial_planner association' do
      it { should belong_to(:financial_planner) }
    end

    context 'reservation association' do
      it { should have_one(:reservation).dependent(:destroy) }
    end
  end
end
