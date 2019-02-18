# frozen_string_literal: true

class TimeFrame < ApplicationRecord
  belongs_to :financial_planner
  has_one :reservation, dependent: :destroy
  accepts_nested_attributes_for :reservation, allow_destroy: true

  validates :financial_planner_id, uniqueness: { scope: [:reservation_date, :start_time] }
  validates :start_time, presence: true
  validates :end_time, presence: true
end
