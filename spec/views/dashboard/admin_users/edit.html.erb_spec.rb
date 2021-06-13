# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'dashboard/admin_users/edit', type: :view do
  before(:each) do
    @admin_user = assign(:admin_user, create(:admin_user))
  end

  it 'renders the edit admin_user form' do
    render

    assert_select 'form[action=?][method=?]', dashboard_admin_user_path(@admin_user), 'post' do
      assert_select 'input[type=?][name=?][value=?]', 'hidden', '_method', 'patch'
      assert_select 'input[name=?]', 'admin_user[name]'
      assert_select 'input[name=?]', 'admin_user[password]'
      assert_select 'input[name=?]', 'admin_user[email]'
      assert_select 'input[name=?]', 'admin_user[age]'
      assert_select 'input[name=?]', 'admin_user[phone]'
      assert_select 'input[name=?]', 'admin_user[address]'
      assert_select 'input[type=?]', 'submit'
    end
  end
end
