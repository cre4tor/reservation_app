# frozen_string_literal: true

FactoryBot.define do
  factory :time_frame do
    sequence(:start_time) { |n| Tod::TimeOfDay.parse('10:00') + 30.minutes * n % 10 }
    reservation_date '2019-05-01'
  end

  factory :user do
    sequence(:first_name) { |n| "john#{n}" }
    sequence(:last_name) { |n| "john#{n}" }
    sequence(:email) { |n| "john#{n}@john.com" }
    sequence(:password) { |n| "johnjohn#{n}" }

    trait :with_fp do
      after(:build) do |user|
        user.build_financial_planner
      end
    end

    trait :with_client do
      after(:build) do |user|
        user.build_client
      end
    end
  end
end
