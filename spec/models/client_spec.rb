# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Client, type: :model do
  # Client 依存関係
  describe 'client associations' do
    # association type
    describe 'belongs_to' do
      it { should belong_to(:user) }
    end
    describe 'has_many' do
      it { should have_many(:reservations).dependent(:destroy) }
    end
  end
end
