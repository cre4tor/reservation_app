# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user page test', type: :request do
  describe 'GET #show login/logout' do
    let(:user) { create(:user) }

    include SessionsHelper

    before do
      post login_path params: { session: { email: user.email, password: user.password } }
      current_user.build_financial_planner
      get user_url user
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'show user name' do
      expect(response.body).to include "#{user.first_name} #{user.last_name}"
    end

    it 'logout' do
      delete logout_path
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'GET #new' do
    before { get new_user_url }

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'assingns new @user' do
      expect(assigns(:user)).to be_a_new User
    end

    it 'renders the :new template' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let(:user_attributes) { attributes_for(:user) }

    it 'saves new user' do
      expect do
        post users_url, params: { user: user_attributes }
      end.to change(User, :count).by(1)
    end

    it 'redirects the :create template' do
      post users_url, params: { user: user_attributes }
      user = User.last
      expect(response).to redirect_to(user_path(user))
    end
  end
end
