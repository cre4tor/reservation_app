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
        user.build_financial_planner
      end
    end

    trait :with_client do
      client_id = 1
      after(:build) do |user|
        client = user.build_client
        client.id = client_id
        client_id += 1
      end
    end

    trait :with_time_frame do
      time_frame_id = 1
      after(:build) do |user|
        fp = user.build_financial_planner
        fp.id = time_frame_id
        attr = attributes_for(:time_frame, :generate)
        tf = fp.time_frames.new(attr)
        tf.id = time_frame_id
        time_frame_id += 1
      end
    end
  end
end
