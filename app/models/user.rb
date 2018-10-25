class User < ApplicationRecord
  has_one :fp, dependent: :destroy
  accepts_nested_attributes_for :fp, allow_destroy: true
  has_one :client, dependent: :destroy
  accepts_nested_attributes_for :client, allow_destroy: true 
end
