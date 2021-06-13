# frozen_string_literal: true

class Book < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  has_many :admin_users_books, class_name: 'AdminUserBook', dependent: :delete_all
  has_many :admin_users, through: :admin_users_books
end
