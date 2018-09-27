class User < ApplicationRecord
  has_one :fp, dependent: :destroy
  accepts_nested_attributes_for :fp, allow_destroy: true
  has_one :client, dependent: :destroy
  accepts_nested_attributes_for :client, allow_destroy: true
  
  has_secure_password validations: true
  
  validates :name, presence:true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
