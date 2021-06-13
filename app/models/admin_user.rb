# frozen_string_literal: true

class AdminUser < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable,
         :trackable, :recoverable

  include DeviseTokenAuth::Concerns::User

  validates :age, numericality: { greater_than: 0, less_than: 100 }, allow_blank: true

  has_many :admin_users_books, class_name: 'AdminUserBook', dependent: :delete_all
  has_many :books, through: :admin_users_books

  TYPES = %w[Admin User].freeze

  TYPES.each do |t|
    t = t.downcase

    define_method("is_#{t}?") do
      t == type.downcase
    end
  end
end
