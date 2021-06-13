# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'dashboard/books/show', type: :view do
  before(:each) do
    @book = assign(:book, book)
  end

  let(:book) { create(:book) }

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match /#{book.name}/
  end
end
