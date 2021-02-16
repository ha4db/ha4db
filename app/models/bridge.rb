# frozen_string_literal: true

# Bridge class
class Bridge < ApplicationRecord
  has_many :soundnesses
  has_many :regular_inspections
  has_many :components

  validates :title, presence: true
  validates :address, presence: true
  validates :location, presence: true

  store_accessor :other_data, :road_name
end
