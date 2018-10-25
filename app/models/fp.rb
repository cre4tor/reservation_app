class Fp < ApplicationRecord
  before_save { self.email = email.downcase }
  belongs_to :user
  
  def name
    "#{first_name} #{last_name}"
  end

  has_secure_password validations: true
  validates :password, presence: true, length: { minimum: 6 }
  
  validates :name, presence:true, length: { maximum: 31 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true,
                    length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
end
