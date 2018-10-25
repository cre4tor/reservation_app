class Client < ApplicationRecord
  belongs_to :user

  def name
    "#{farst_name} #{last_name}"
  end
end
 
  has_secure_password validations: true
  
  validates :name, presence:true, uniqueness: true
  validates :email, presence: true, uniqueness: true
