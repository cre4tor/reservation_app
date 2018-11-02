class User < ApplicationRecord
  attr_accessor :remember_token
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

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authentiated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
