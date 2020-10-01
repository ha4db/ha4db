# frozen_string_literal: true

# Bridge class
class Bridge < ApplicationRecord
  validates :title, presence: true
  validates :address, presence: true
  validates :location, presence: true
end
