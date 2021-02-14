# frozen_string_literal: true

# RegularInspection Factorybot
FactoryBot.define do
  factory :regular_inspection do
    bridge
    sequence(:title) { |i| "Inspection #{i}" }
    sequence(:person_responsible) { |i| "Person responsible #{i}"}
    periodic_inspection_date { Faker::Date.backward(days: 14) }
    record_updated_date { Faker::Date.backward(days: 14) }
    start_date { Faker::Date.backward(days: 20) }
    end_date { Faker::Date.backward(days: 10) }
  end
end
