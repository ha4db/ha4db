# frozen_string_literal: true

FactoryBot.define do
  factory :state_of_inspection do
    regular_inspection
    bridge_content
    component_category { Component.categories[:superstructure_main_girder] }
  end
end
