# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # 存在性の検証
  describe 'presence' do
    # 姓、名、メール、パスワードがあれば有効な状態であること
    it 'is valid with a first name, last name, email, and password' do
      user = build(:user)
      expect(user).to be_valid
    end

    # 名がなければ無効な状態であること should validate_presence_of :firstname でも良さそう
    it 'is invalid without a first name' do
      user = build(:user, first_name: '')
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    # 姓がなければ無効な状態であること
    it 'is invalid without a last name' do
      user = build(:user, last_name: '')
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    # メールアドレスがなければ無効な状態であること
    it 'is invalid without an email address' do
      user = build(:user, email: '')
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # パスワードがなければ無効な状態であること
    it 'is invalid without an password address' do
      user = build(:user, password: '')
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
  end

  # 文字数制限
  describe 'characters limit' do
    # パスワードが文字数制限を下回れば無効な状態であること
    it 'is invalid if password falls below the characters limit' do
      user = build(:user, password: '00000')
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    # 姓が文字数制限を超えれば無効な状態であること
    it 'is invalid if first name exceeds the characters limit' do
      user = build(:user, first_name: 'a' * 16)
      user.valid?
      expect(user.errors[:first_name]).to include('is too long (maximum is 15 characters)')
    end

    # 名が文字数制限を超えれば無効な状態であること
    it 'is invalid if last name exceeds the characters limit' do
      user = build(:user, last_name: 'a' * 16)
      user.valid?
      expect(user.errors[:last_name]).to include('is too long (maximum is 15 characters)')
    end

    # emailが文字数制限を超えれば無効な状態であること
    it 'is invalid if email exceeds the characters limit' do
      user = build(:user, email: 'a' * 252 + '@a.a')
      user.valid?
      expect(user.errors[:email]).to include('is too long (maximum is 255 characters)')
    end
  end

  # 重複したメールアドレスなら無効な状態であること
  it 'is invalid with a duplicate email address' do
    user = create(:user)
    another_user = build(:user, email: user.email)
    another_user.valid?
    expect(another_user.errors[:email]).to include('has already been taken')
  end
end
