# frozen_string_literal: true

# Inspection Factorybot
FactoryBot.define do
  factory :inspection do
    bridge
    sequence(:title) { |i| "Inspection #{i}" }
    geom { 'POINT(139.895697 35.325315)' }
  end
end
