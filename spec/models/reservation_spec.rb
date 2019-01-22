# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reservation, type: :model do
  # Reservation 依存関係
  describe 'client associations' do
    # association targets
    context 'client association' do
      it { should belong_to(:client) }
    end

    context 'time_frame association' do
      it { should belong_to(:time_frame) }
    end
  end
end
