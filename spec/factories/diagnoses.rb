# frozen_string_literal: true

FactoryBot.define do
  factory :diagnosis do
    regular_inspection
    component_category { Component.categories[:superstructure_main_girder] }
    result { Diagnosis.diagnosis_results[:one] }
    injury { nil }
    sequence(:observation) { |i| "observation #{i}" }
  end
end
