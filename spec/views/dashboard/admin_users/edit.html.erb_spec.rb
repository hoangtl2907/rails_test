# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'dashboard/admin_users/edit', type: :view do
  before(:each) do
    @admin_user = assign(:admin_user, create(:admin_user))
  end

  it 'renders the edit admin_user form' do
    render

    assert_select 'form[action=?][method=?]', dashboard_admin_user_path(@admin_user), 'post' do
    end
  end
end
