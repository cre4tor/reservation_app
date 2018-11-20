class FinancialPlanner < ApplicationRecord
  belongs_to :user
  has_many :time_frames, dependent: :destroy
  accepts_nested_attributes_for :time_frames, allow_destroy: true
end
