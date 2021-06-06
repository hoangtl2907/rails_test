# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'dashboard/admin_users/index', type: :view do
  before(:each) do
    assign(
      :admin_users,
      Kaminari.paginate_array([create(:admin_user), create(:admin_user)]).page(1)
    )
    allow(view).to receive(:order_params).and_return({})
  end

  it 'renders a list of admin_users' do
    render
  end
end
