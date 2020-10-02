# frozen_string_literal: true

# BridgeContent Factorybot
FactoryBot.define do
  factory :bridge_content do
    sequence(:title) { |i| "Bridge #{i}" }
  end
end
