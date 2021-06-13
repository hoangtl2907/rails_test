require 'rails_helper'

module Dashboard
  RSpec.describe BooksController, type: :routing do
    describe 'routing' do
      it 'routes to #index' do
        expect(get: '/dashboard/books').to route_to('dashboard/books#index')
      end

      it 'routes to #new' do
        expect(get: '/dashboard/books/new').to route_to('dashboard/books#new')
      end

      it 'routes to #show' do
        expect(get: '/dashboard/books/1').to route_to('dashboard/books#show', id: '1')
      end

      it 'routes to #edit' do
        expect(get: '/dashboard/books/1/edit').to route_to('dashboard/books#edit', id: '1')
      end

      it 'routes to #create' do
        expect(post: '/dashboard/books').to route_to('dashboard/books#create')
      end

      it 'routes to #update via PUT' do
        expect(put: '/dashboard/books/1').to route_to('dashboard/books#update', id: '1')
      end

      it 'routes to #update via PATCH' do
        expect(patch: '/dashboard/books/1').to route_to('dashboard/books#update', id: '1')
      end

      it 'routes to #destroy' do
        expect(delete: '/dashboard/books/1').to route_to('dashboard/books#destroy', id: '1')
      end
    end
  end
end
