# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'time_frame page test', type: :request do
  describe 'GET #new' do
    let(:user) { create(:user) }

    include SessionsHelper

    before do
      post login_path params: { session: { email: user.email, password: user.password } }
      get user_url user
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user, :with_fp) }
    let(:time_frame_attributes) { attributes_for(:time_frame) }

    before do
      post login_path params: { session: { email: user.email, password: user.password } }
      get user_url user
    end

    it 'saves new time_frame' do
      expect do
        post time_frames_url, params: { time_frame: time_frame_attributes }
      end.to change(TimeFrame, :count).by(1)
    end

    it 'redirects the :create template' do
      post time_frames_url, params: { time_frame: time_frame_attributes }
      user = User.last
      expect(response).to redirect_to(user_path(user))
    end
  end
end
