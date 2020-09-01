# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    login_name { Faker::Internet.user_name }
    password { 'passw0rd' }
  end
end
