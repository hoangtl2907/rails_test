# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    name { Faker::Book.title }
    price { Faker::Number.between(from: 1, to: 1000) }
  end
end
