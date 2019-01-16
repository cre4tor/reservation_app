# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET #show' do
    let(:user) { create(:user) }
    before { get :show, params: { id: user.id } }

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'assingns @user' do
      expect(assigns(:user)).to eq user
    end

    it 'renders the :show template' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

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
        post :create, params: { user: user_attributes }
      end.to change(User, :count).by(1)
    end

    it 'redirects the :create template' do
      post :create, params: { user: user_attributes }
      user = User.last
      expect(response).to redirect_to(user_path(user))
    end
  end
end
