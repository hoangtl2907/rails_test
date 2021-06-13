# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'dashboard/books/index', type: :view do
  before(:each) do
    assign(
      :books,
      Kaminari.paginate_array([book1, book2]).page(1)
    )
    allow(view).to receive(:order_params).and_return({})
  end

  let(:book1) { create(:book) }
  let(:book2) { create(:book) }

  it 'renders a list of books' do
    render
    expect(rendered).to match /#{book1.name}/
    expect(rendered).to match /#{book2.name}/
  end
end
