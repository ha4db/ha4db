# frozen_string_literal: true

FactoryBot.define do
  factory :bridge_content_injury do
    bridge_content
    injury
    seek { 0 }
  end
end
