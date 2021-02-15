# frozen_string_literal: true

FactoryBot.define do
  factory :component do
    bridge
    sequence(:title) { |i| "title #{i}" }
    component_category { Component.categories[:superstructure_main_girder] }
  end
end
