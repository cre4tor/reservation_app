# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    context 'correct user' do
      it 'redirected to user page' do
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
