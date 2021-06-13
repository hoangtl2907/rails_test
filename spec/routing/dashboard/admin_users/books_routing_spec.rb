require 'rails_helper'

module Dashboard
  module AdminUsers
    RSpec.describe BooksController, type: :routing do
      describe 'routing' do
        it 'routes to #create' do
          expect(post: '/dashboard/admin_users/1/books')
            .to route_to('dashboard/admin_users/books#create', admin_user_id: '1')
        end

        it 'routes to #destroy' do
          expect(delete: '/dashboard/admin_users/1/books/1')
            .to route_to('dashboard/admin_users/books#destroy', admin_user_id: '1', id: '1')
        end
      end
    end
  end
end
