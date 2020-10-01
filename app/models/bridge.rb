# frozen_string_literal: true

# Bridge class
class Bridge < ApplicationRecord
  validates :title, presence: true
  validates :address, presence: true
  validates :location, presence: true

  store_accessor :other_data, :road_name
end
