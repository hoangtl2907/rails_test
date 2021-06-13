# frozen_string_literal: true

FactoryBot.define do
  factory :admin_user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { Faker::Name.name }
    type { 'Admin' }

    trait :with_books do
      after(:create) do
        build_list(:book, 10)
      end
    end
  end
end
