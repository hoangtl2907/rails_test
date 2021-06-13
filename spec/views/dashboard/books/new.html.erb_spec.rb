# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'dashboard/books/new', type: :view do
  before(:each) do
    assign(:book, Book.new)
  end

  it 'renders new book form' do
    render

    assert_select 'form[action=?][method=?]', dashboard_books_path, 'post' do
      assert_select 'input[name=?]', 'book[name]'
      assert_select 'input[name=?]', 'book[price]'
      assert_select 'input[type=?]', 'submit'
    end
  end
end
