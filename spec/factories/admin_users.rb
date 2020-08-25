# frozen_string_literal: true

FactoryBot.define do
  factory :admin_user do
    login_name { Faker::Internet.user_name }
    password { 'passw0rd' }
  end
end
