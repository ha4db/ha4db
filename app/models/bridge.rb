# frozen_string_literal: true

# Bridge class
class Bridge < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :location, presence: true
end
