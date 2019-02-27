class Reservation < ApplicationRecord
  belongs_to :time_frame
  belongs_to :client
end
