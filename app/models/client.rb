class Client < ApplicationRecord
  belongs_to :user

  def name
    "#{farst_name} #{last_name}"
  end
end
