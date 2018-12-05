class Reservation < ApplicationRecord
  belongs_to :time_frame, optional: true
  belongs_to :client, optional: true
end
