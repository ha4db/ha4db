# frozen_string_literal: true

# Soundness Factorybot
FactoryBot.define do
  factory :soundness do
    bridge
    sequence(:evaluation) { |i| "Soundness evaluation #{i}" }
    evaluation_at { Faker::Date.backward(days: 14) }
    overall_evaluation { Soundness.overall_evaluations[:one] }
  end
end
