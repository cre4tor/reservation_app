# frozen_string_literal: true

class Client < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  accepts_nested_attributes_for :reservations, allow_destroy: true
end
