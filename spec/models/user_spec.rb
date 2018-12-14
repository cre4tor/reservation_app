# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # 姓、名、メール、パスワードがあれば有効な状態であること
  it 'is valid with a first name, last name, email, and password'
  # 名がなければ無効な状態であること
  it 'is invalid without a first name'
  # 姓がなければ無効な状態であること
  it 'is invalid without a last name'
  # メールアドレスがなければ無効な状態であること
  it 'is invalid without an email address'
  # 重複したメールアドレスなら無効な状態であること
  it 'is invalid with a duplicate email address'
end