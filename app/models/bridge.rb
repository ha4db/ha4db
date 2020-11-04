# frozen_string_literal: true

# Bridge class
class Bridge < ApplicationRecord
  has_many :bridge_contents
  has_many :inspections
  has_many :soundnesses

  validates :title, presence: true
  validates :address, presence: true
  validates :location, presence: true

  store_accessor :other_data, :road_name
end
