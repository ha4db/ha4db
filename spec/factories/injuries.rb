# frozen_string_literal: true

FactoryBot.define do
  factory :injury do
    regular_inspection
    component
    sequence(:injury_type) { |i| "Injury type #{i}" }
    injury_grade { Injury.grades[:a] }
  end
end
