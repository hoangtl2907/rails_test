# frozen_string_literal: true

FactoryBot.define do
  factory :admin_user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { Faker::Name.name }
  end
end
