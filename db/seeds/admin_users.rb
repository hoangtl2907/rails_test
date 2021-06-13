# frozen_string_literal: true

def fake_info
  {
    email: Faker::Internet.email,
    password: Faker::Name.name,
    name: Faker::Name.name,
    age: Faker::Number.number(digits: 2),
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.full_address
  }
end

admins = 50.times.map do
  Admin.new(fake_info)
end

Admin.import admins, on_duplicate_key_ignore: true

users = 50.times.map do
  User.new(fake_info)
end

User.import users, on_duplicate_key_ignore: true
