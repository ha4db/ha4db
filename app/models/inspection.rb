# frozen_string_literal: true

# Inspection Model
class Inspection < ApplicationRecord
  belongs_to :bridge
  validates :title, presence: true
end
