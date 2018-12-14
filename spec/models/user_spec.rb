# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # 存在性の検証
  describe 'presence' do
    # 姓、名、メール、パスワードがあれば有効な状態であること
    it 'is valid with a first name, last name, email, and password' do
      user = User.new(
        first_name: 'john',
        last_name:  'john',
        email:      'john@john.com',
        password:   'johnjohnjohn'
      )
      expect(user).to be_valid
    end

    # 名がなければ無効な状態であること
    it 'is invalid without a first name' do
      user = User.new(first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    # 姓がなければ無効な状態であること
    it 'is invalid without a last name' do
      user = User.new(last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    # メールアドレスがなければ無効な状態であること
    it 'is invalid without an email address' do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
  end

  # 重複したメールアドレスなら無効な状態であること
  it 'is invalid with a duplicate email address' do
    User.create(
      first_name: 'john',
      last_name:  'john',
      email:      'john@john.com',
      password:   'johnjohnjohn'
    )
    user = User.new(
      first_name: 'john',
      last_name:  'john',
      email:      'john@john.com',
      password:   'johnjohnjohn'
    )
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end
end
