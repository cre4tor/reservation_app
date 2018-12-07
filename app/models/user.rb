class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_one :financial_planner, dependent: :destroy
  accepts_nested_attributes_for :financial_planner, allow_destroy: true
  has_one :client, dependent: :destroy
  accepts_nested_attributes_for :client, allow_destroy: true
  has_secure_password validations: true
  
  validates :password, presence: true, length: {minimum: 6}
  validates :first_name, presence: true, length: { maximum: 15 }
  validates :last_name, presence: true, length: {maximum: 15}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true,
                    length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
                    confirmation: {case_sensitive: false}
                        
  def full_name
    "#{first_name} #{last_name}"
  end
end
