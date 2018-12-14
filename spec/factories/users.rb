# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "john#{n}" }
    sequence(:last_name) { |n| "john#{n}" }
    sequence(:email) { |n| "john#{n}@john.com" }
    sequence(:password) { |n| "johnjohn#{n}" }
  end
end
