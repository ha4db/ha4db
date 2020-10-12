# frozen_string_literal: true

# BridgeContent Model
class BridgeContent < ApplicationRecord
  belongs_to :bridge
  has_many :bridge_content_inspections
  has_many :inspections, through: :bridge_content_inspections
  validates :title, presence: true
  has_one_attached :data
  validates :data, presence: true
end
