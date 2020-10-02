# frozen_string_literal: true

# BridgeContent Model
class BridgeContent < ApplicationRecord
  belongs_to :bridge
  validates :title, presence: true
  has_one_attached :data
  validates :data, presence: true
end
