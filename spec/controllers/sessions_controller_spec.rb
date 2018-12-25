# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    let(:user_attributes) { attributes_for(:user) }
    context 'correct user' do
      it 'redirected to user page' do
        post :create, params: { user: user_attributes }
        user = User.last
        expect(response).to redirect_to user_path(user)
      end
    end
    context 'incorrect user' do
      it 'redirected to :new page' do
      end
    end
  end
  describe 'DELETE #destroy' do
  end
end
