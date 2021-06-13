require 'rails_helper'

RSpec.describe 'Dashboard::Books', type: :request do
  let(:admin) { create(:admin_user) }

  describe 'POST /dashboard/admin_users/books' do
    before do
      sign_in admin, scope: :dashboard_admin_user
    end

    let(:book) { create(:book) }
    let(:params) do
      {
        admin_user_id: admin.id,
        id: book.id
      }
    end

    it 'redirect to admin_users show' do
      post dashboard_admin_user_books_path params

      expect(response).to redirect_to(dashboard_admin_user_path(admin))
    end
  end

  describe 'DELETE /dashboard/admin_users/books/:id' do
    before do
      sign_in admin, scope: :dashboard_admin_user
    end

    let(:book) { create(:book) }
    let(:params) do
      {
        admin_user_id: admin.id,
        id: book.id
      }
    end

    it 'redirect to admin_users show' do
      delete dashboard_admin_user_book_path params

      expect(response).to redirect_to(dashboard_admin_user_path(admin))
    end
  end
end
