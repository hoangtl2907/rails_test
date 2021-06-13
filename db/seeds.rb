# frozen_string_literal: true

Dir[Rails.root.join('db/seeds/*.rb')].sort.each do |file|
  puts "Processing #{file.split('/').last}"
  require file
end

email = 'admin@test.com'
unless Admin.exists?(email: email)
  Admin.create(
    email: email,
    password: 'admintest',
    name: 'admin',
    age: Faker::Number.number(digits: 2),
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.full_address
  )
end

email = 'user@test.com'
unless User.exists?(email: email)
  User.create(
    email: email,
    password: 'usertest',
    name: 'user',
    age: Faker::Number.number(digits: 2),
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.full_address
  )
end
