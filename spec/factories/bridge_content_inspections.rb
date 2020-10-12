# frozen_string_literal: true

# BridgeContentInspection Factorybot
FactoryBot.define do
  factory :bridge_content_inspection do
    bridge_content
    inspection
  end
end
