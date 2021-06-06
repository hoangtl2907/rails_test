# frozen_string_literal: true

class AdminUser < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable,
         :trackable, :recoverable

  validates :age, numericality: { greater_than: 0, less_than: 100 }, allow_blank: true
end
