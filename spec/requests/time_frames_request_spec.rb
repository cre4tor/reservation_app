# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe 'time_frame page test', type: :request do
  describe 'GET #new' do
    let(:user) { create(:user, :with_fp) }

    before do
      post login_path params: { session: { email: user.email, password: user.password } }
      subject { get new_time_frame_path }
    end

    it 'has a 200 status code' do
      expect(subject.status).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user, :with_fp) }
    let(:time_frame_attributes) { attributes_for(:time_frame, :post) }

    before { post login_path params: { session: { email: user.email, password: user.password } } }

    it 'is saved new time_frame' do
      expect do
        post time_frames_path, params: { time_frame: time_frame_attributes }
      end.to change(TimeFrame, :count).by(1)
    end

    include SessionsHelper

    it 'is redirecting to the create template page' do
      post time_frames_path, params: { time_frame: time_frame_attributes }
      user = current_user
      expect(response).to redirect_to(user_path(user))
    end

    it 'is flash[:success] message is assumed' do
      post time_frames_path, params: { time_frame: time_frame_attributes }
      expect(flash[:success]).to eq 'Reservation frame set completed!'
    end
  end
end
