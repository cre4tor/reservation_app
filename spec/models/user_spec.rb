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

  # メールアドレスの一意性
  describe 'email uniqueness' do
    # 重複したメールアドレスなら無効な状態であること
    it 'is invalid with a duplicate email address' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end

    # 大文字と小文字が混在した場合
    context 'when uppercase-mixed case' do
      let(:uppercase_mixed_email) { 'FizZ@bUZz.fOO' }
      # 小文字でDBに保存
      it 'should be saved as lower-case' do
        user = build(:user)
        user.email = uppercase_mixed_email
        user.save
        expect(user.reload.email).to eq uppercase_mixed_email.downcase
      end
    end
  end

  # メールアドレスの書式
  describe 'email format' do
    # 有効な書式の場合
    context 'valid format case' do
      it 'should be valid' do
        valid_email = %w[hello@world.JP QU_S_-wY@z.c.rb kern.el@fo.us u+x@beze.cvn]
        valid_email.each do |addr|
          user = build(:user)
          user.email = addr
          expect(user).to be_valid
        end
      end
    end
    # 無効な書式の場合
    context 'invalid format case' do
      it 'should be invalid' do
        invalid_email = %w[fock@teyp,o hello_world_sa.ppap tutorial.man@oo. foo@bar_bar.org fiz@z+bazz]
        invalid_email.each do |addr|
          user = build(:user)
          user.email = addr
          expect(user).not_to be_valid
        end
      end
    end
  end

  # 依存関係
  describe 'user associations' do
    let(:user) { create(:user) }

    context 'financial_planner case' do
      it 'should have the right associated user' do
        financial_planner = user.build_financial_planner
        financial_planner.user_id == user.id
      end

      it 'should have [has_one] association' do
        should have_one(:financial_planner)
      end
    end

    context 'client case' do
      it 'should have the right associated user' do
        client = user.build_client
        client.user_id == user.id
      end

      it 'should have [has_one] association' do
        should have_one(:client)
      end
    end
  end
end
