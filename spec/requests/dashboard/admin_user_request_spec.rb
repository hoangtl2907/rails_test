require 'rails_helper'

RSpec.describe 'Dashboard::AdminUsers', type: :request do
  let(:admin) { create(:admin_user) }

  describe 'GET /dashboard/admin_users' do
    before do
      sign_in admin, scope: :dashboard_admin_user
    end

    it 'render index template' do
      get dashboard_admin_users_path

      expect(response).to render_template(:index)
    end
  end

  describe 'GET /dashboard/admin_users/new' do
    before do
      sign_in admin, scope: :dashboard_admin_user
    end

    it 'render new template' do
      get new_dashboard_admin_user_path

      expect(response).to render_template(:new)
    end
  end

  describe 'POST /dashboard/admin_users' do
    before do
      sign_in admin, scope: :dashboard_admin_user
    end

    let(:params) do
      {
        admin_user: {
          email: Faker::Internet.email,
          name: Faker::Name.name,
          password: Faker::Name.name
        }
      }
    end

    it 'redirect to index' do
      post dashboard_admin_users_path params

      expect(response).to redirect_to(dashboard_admin_users_path)
    end
  end

  describe 'GET /dashboard/admin_users/:id' do
    before do
      sign_in admin, scope: :dashboard_admin_user
    end

    it 'render show template' do
      get dashboard_admin_user_path admin.id

      expect(response).to render_template(:show)
    end
  end

  describe 'GET /dashboard/admin_users/:id/edit' do
    before do
      sign_in admin, scope: :dashboard_admin_user
    end

    it 'render edit template' do
      get edit_dashboard_admin_user_path admin.id

      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH /dashboard/admin_users/:id' do
    before do
      sign_in admin, scope: :dashboard_admin_user
    end

    let(:params) do
      {
        id: admin.id,
        admin_user: {
          name: Faker::Name.name
        }
      }
    end

    it 'redirect to index' do
      patch dashboard_admin_user_path params

      expect(response).to redirect_to(dashboard_admin_users_path)
    end
  end

  describe 'DELETE /dashboard/admin_users/:id' do
    before do
      sign_in admin, scope: :dashboard_admin_user
    end

    it 'redirect to index' do
      delete dashboard_admin_user_path admin.id

      expect(response).to redirect_to(dashboard_admin_users_path)
    end
  end
end
