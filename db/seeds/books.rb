# frozen_string_literal: true

books = 100.times.map do
  Book.new(
    name: Faker::Book.title,
    price: Faker::Number.between(from: 1, to: 1000)
  )
end

Book.import books

book_ids = Book.all.pluck(:id)
admin_user_ids = AdminUser.all.pluck(:id)

admin_users_books = admin_user_ids.map do |au_id|
  number_of_book = Faker::Number.number(digits: 1)

  number_of_book.times.map do
    AdminUserBook.new(
      admin_user_id: au_id,
      book_id: book_ids.sample
    )
  end
end.flatten

AdminUserBook.import admin_users_books
