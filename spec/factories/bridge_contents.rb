# frozen_string_literal: true

# BridgeContent Factorybot
FactoryBot.define do
  factory :bridge_content do
    bridge
    sequence(:title) { |i| "Bridge Contents #{i}" }
    data { fixture_file_upload(Rails.root.join('spec', 'testdata', 'testimage.jpg')) }
  end
end
