# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  context 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_numericality_of(:age).is_greater_than(0).is_less_than(100) }
  end
end
