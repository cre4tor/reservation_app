# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
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
  end
  describe 'POST #create' do
  end
end
