# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :time_frame
  belongs_to :client
end
