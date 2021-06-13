# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'dashboard/books/edit', type: :view do
  before(:each) do
    @book = assign(:book, create(:book))
  end

  it 'renders the edit admin_user form' do
    render

    assert_select 'form[action=?][method=?]', dashboard_book_path(@book), 'post' do
      assert_select 'input[type=?][name=?][value=?]', 'hidden', '_method', 'patch'
      assert_select 'input[name=?]', 'book[name]'
      assert_select 'input[name=?]', 'book[price]'
      assert_select 'input[type=?]', 'submit'
    end
  end
end
