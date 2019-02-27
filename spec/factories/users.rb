# frozen_string_literal: true

FactoryBot.define do
  factory :time_frame do
    reservation_date '2019-05-01'

    trait :post do
      sequence(:start_time) { |n| Tod::TimeOfDay.parse('10:00') + 30.minutes * n % 10 }
    end

    trait :generate do
      sequence(:start_time) { |n| (Tod::TimeOfDay.parse('10:00') + 30.minutes * n % 10).to_s }
      sequence(:end_time) { |n| (Tod::TimeOfDay.parse('10:30') + 30.minutes * n % 10).to_s }
    end
  end

  factory :user do
    sequence(:id) { |n| n }
    sequence(:first_name) { |n| "john#{n}" }
    sequence(:last_name) { |n| "john#{n}" }
    sequence(:email) { |n| "john#{n}@john.com" }
    sequence(:password) { |n| "johnjohn#{n}" }

    trait :with_fp do
      after(:build) do |user|
        user.build_financial_planner(id: user.id)
      end
    end

    trait :with_client do
      after(:build) do |user|
        user.build_client(id: user.id)
      end
    end

    trait :with_time_frame do
      after(:build) do |user|
        fp = user.build_financial_planner(id: user.id)
        attr = attributes_for(:time_frame, :generate)
        fp.time_frames.new(attr.merge(id: fp.id))
      end
    end
  end
end
