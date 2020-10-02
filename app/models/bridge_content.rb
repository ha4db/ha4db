# frozen_string_literal: true

# BridgeContent Model
class BridgeContent < ApplicationRecord
  validates :title, presence: true
end
