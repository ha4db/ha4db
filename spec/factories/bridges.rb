# frozen_string_literal: true

FactoryBot.define do
  factory :bridge do
    name { 'MyString' }
    location { 'POINT(139.895697 35.325315)' }
  end
end
