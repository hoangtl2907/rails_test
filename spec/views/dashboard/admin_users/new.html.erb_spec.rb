# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'dashboard/admin_users/new', type: :view do
  before(:each) do
    assign(:admin_user, AdminUser.new)
  end

  it 'renders new admin_user form' do
    render

    assert_select 'form[action=?][method=?]', dashboard_admin_users_path, 'post' do
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
