# frozen_string_literal: true

FactoryBot.define do
  factory :bridge do
    sequence(:title) { |i| "Bridge #{i}" }
    location { 'POINT(139.895697 35.325315)' }
    sequence(:address) { |i| "Address #{i}" }
    bridge_contents { [FactoryBot.build(:bridge_content, bridge: nil)] }
    inspections { [FactoryBot.build(:inspection, bridge: nil)] }
  end
end
