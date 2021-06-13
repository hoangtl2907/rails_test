# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'dashboard/admin_users/show', type: :view do
  before(:each) do
    admin_user = create(:admin_user, :with_books)
    @admin_user = assign(:admin_user, admin_user)
    @books = assign(:books, admin_user.books)
  end

  it 'renders attributes in <p>' do
    render
  end
end
