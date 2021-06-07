# frozen_string_literal: true

class AdminUserBook < ApplicationRecord
  self.table_name = 'admin_users_books'

  validates :book_id, uniqueness: { scope: :admin_user_id, message: 'is already owned.' }

  belongs_to :admin_user
  belongs_to :book
end
