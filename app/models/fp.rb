class Fp < ApplicationRecord
  belongs_to :user
  
  def name
    "#{first_name} #{last_name}"
  end

  has_secure_password validations: true
  
  validates :name, presence:true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
