require 'rails_helper'

RSpec.describe 'Dashboard::AdminUsers::Books', type: :request do
  let(:admin) { create(:admin_user) }

  describe 'GET /dashboard/books' do
    before do
      sign_in admin, scope: :dashboard_admin_user
    end

    it 'render index template' do
      get dashboard_books_path

      expect(response).to render_template(:index)
    end
  end

  describe 'GET /dashboard/books/new' do
    before do
      sign_in admin, scope: :dashboard_admin_user
    end

    it 'render new template' do
      get new_dashboard_book_path

      expect(response).to render_template(:new)
    end
  end

  describe 'POST /dashboard/books' do
    before do
      sign_in admin, scope: :dashboard_admin_user
    end

    let(:params) do
      {
        book: {
          name: Faker::Book.title,
          price: Faker::Number.between(from: 1, to: 1000)
        }
      }
    end

    it 'redirect to index' do
      post dashboard_books_path params

      expect(response).to redirect_to(dashboard_books_path)
    end
  end

  describe 'GET /dashboard/books/:id' do
    before do
      sign_in admin, scope: :dashboard_admin_user
    end

    let(:book) { create(:book) }

    it 'render show template' do
      get dashboard_book_path book.id

      expect(response).to render_template(:show)
    end
  end

  describe 'GET /dashboard/books/:id/edit' do
    before do
      sign_in admin, scope: :dashboard_admin_user
    end

    let(:book) { create(:book) }

    it 'render edit template' do
      get edit_dashboard_book_path book.id

      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH /dashboard/books/:id' do
    before do
      sign_in admin, scope: :dashboard_admin_user
    end

    let(:book) { create(:book) }

    let(:params) do
      {
        id: book.id,
        book: {
          name: Faker::Book.title
        }
      }
    end

    it 'redirect to index' do
      patch dashboard_book_path params

      expect(response).to redirect_to(dashboard_books_path)
    end
  end

  describe 'DELETE /dashboard/books/:id' do
    before do
      sign_in admin, scope: :dashboard_admin_user
    end

    let(:book) { create(:book) }

    it 'redirect to index' do
      delete dashboard_book_path book.id

      expect(response).to redirect_to(dashboard_books_path)
    end
  end
end
