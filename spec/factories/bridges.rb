# frozen_string_literal: true

FactoryBot.define do
  factory :bridge do
    sequence(:title) { |i| "Bridge #{i}" }
    location { 'POINT(139.895697 35.325315)' }
    sequence(:address) { |i| "Address #{i}" }
    bridge_length { 10 }
    width { 4.4 }
  end
end
