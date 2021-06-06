# frozen_string_literal: true

admin_users = 100.times.map do
  AdminUser.new(
    email: Faker::Internet.email,
    password: Faker::Name.name,
    name: Faker::Name.name,
    age: Faker::Number.number(digits: 2),
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.full_address
  )
end

AdminUser.import admin_users, on_duplicate_key_ignore: true
