# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reservation page test', type: :request do
  describe 'GET #new' do
    subject(:response) { get new_reservation_path }
    let(:user) { create(:user, :with_client) }

    before { post login_path params: { session: { email: user.email, password: user.password } } }

    it { is_expected.to eq 200 }
  end

  describe 'POST #create' do
    let(:client) { create(:user, :with_client) }

    before { post login_path params: { session: { email: client.email, password: client.password } } }

    it 'is saved new time_frame' do
      tf = create(:user, :with_time_frame)
      expect do
        post reservations_path, params: { reservation: { time_frame_id: tf.id } }
      end.to change(Reservation, :count).by(1)
    end

    include SessionsHelper

    it 'is redirecting to the create template page' do
      tf = create(:user, :with_time_frame)
      post reservations_path, params: { reservation: { time_frame_id: tf.id } }
      user = current_user
      expect(response).to redirect_to(user_path(user))
    end

    it 'is flash[:success] message is assumed' do
      tf = create(:user, :with_time_frame)
      post reservations_path, params: { reservation: { time_frame_id: tf.id } }
      expect(flash[:success]).to eq 'Reservation SUCCESS!'
    end
  end
end
