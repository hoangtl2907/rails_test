# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminUserBook, type: :model do
  context 'validations' do
    it { should validate_uniqueness_of(:book_id).scoped_to(:admin_user_id).with_message('has been already owned.') }
  end

  context 'associations' do
    it { should belong_to(:admin_user) }
    it { should belong_to(:book) }
  end
end
