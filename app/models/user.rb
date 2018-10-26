class User < ApplicationRecord
  has_one :financial_planner, dependent: :destroy
  accepts_nested_attributes_for :financial_planner, allow_destroy: true
  has_one :client, dependent: :destroy
  accepts_nested_attributes_for :client, allow_destroy: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
