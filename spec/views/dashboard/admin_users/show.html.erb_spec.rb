# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'dashboard/admin_users/show', type: :view do
  before(:each) do
    @admin_user = assign(:admin_user, create(:admin_user))
  end

  it 'renders attributes in <p>' do
    render
  end
end
