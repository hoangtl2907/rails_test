require 'rails_helper'

module Dashboard
  RSpec.describe AdminUsersController, type: :routing do
    describe 'routing' do
      it 'routes to #index' do
        expect(get: '/dashboard/admin_users').to route_to('dashboard/admin_users#index')
      end

      it 'routes to #new' do
        expect(get: '/dashboard/admin_users/new').to route_to('dashboard/admin_users#new')
      end

      it 'routes to #show' do
        expect(get: '/dashboard/admin_users/1').to route_to('dashboard/admin_users#show', id: '1')
      end

      it 'routes to #edit' do
        expect(get: '/dashboard/admin_users/1/edit').to route_to('dashboard/admin_users#edit', id: '1')
      end

      it 'routes to #create' do
        expect(post: '/dashboard/admin_users').to route_to('dashboard/admin_users#create')
      end

      it 'routes to #update via PUT' do
        expect(put: '/dashboard/admin_users/1').to route_to('dashboard/admin_users#update', id: '1')
      end

      it 'routes to #update via PATCH' do
        expect(patch: '/dashboard/admin_users/1').to route_to('dashboard/admin_users#update', id: '1')
      end

      it 'routes to #destroy' do
        expect(delete: '/dashboard/admin_users/1').to route_to('dashboard/admin_users#destroy', id: '1')
      end
    end
  end
end
