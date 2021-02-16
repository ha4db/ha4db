# frozen_string_literal: true

# BridgeContent Factorybot
FactoryBot.define do
  factory :bridge_content do
    regular_inspection
    component { nil }
    sequence(:title) { |i| "Bridge Contents #{i}" }
    after(:build) do |bridge_content|
      bridge_content.data = fixture_file_upload(Rails.root.join('spec', 'testdata', 'testimage.jpg'))
    end
  end
end
