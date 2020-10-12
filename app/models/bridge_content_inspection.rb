# frozen_string_literal: true

# BridgeContentInspection Model
class BridgeContentInspection < ApplicationRecord
  belongs_to :bridge_content
  belongs_to :inspection
  store_accessor :data, :seek
  store_accessor :data, :position
end
