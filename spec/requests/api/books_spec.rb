require 'swagger_helper'

RSpec.describe 'api/books', type: :request, swagger_doc: 'v1/swagger.yaml' do
  path '/api/books' do
    parameter name: 'access-token', in: :header, type: :string, description: 'Access Token'
    parameter name: 'uid', in: :header, type: :string, description: 'Uid'
    parameter name: 'client', in: :header, type: :string, description: 'client'

    let(:current_user) { admin_user }
    let(:auth_headers) { current_user.create_new_auth_token }
    let('access-token') { auth_headers['access-token'] }
    let(:uid) { auth_headers['uid'] }
    let(:client) { auth_headers['client'] }

    get('list books') do
      tags 'Books'
      produces 'application/json'

      response 200, 'successful' do
        before do
          create_list(:book, 10)
        end

        let(:admin_user) { create(:admin_user, type: 'User') }
        schema '$ref' => '#/components/schemas/books'

        run_test!
      end

      response 403, 'forbidden' do
        let(:admin_user) { create(:admin_user, type: 'Admin') }

        run_test!
      end
    end

    post('create book') do
      tags 'Books'
      consumes 'application/json'
      produces 'application/json'
      parameter name: 'params', in: :body, schema: { '$ref' => '#/components/schemas/book_params' }

      let(:params) do
        {
          book: {
            name: Faker::Book.title,
            price: Faker::Number.between(from: 1, to: 1000)
          }
        }
      end

      response 201, 'created' do
        let(:admin_user) { create(:admin_user, type: 'User') }
        schema '$ref' => '#/components/schemas/book'

        run_test!
      end

      response 403, 'forbidden' do
        let(:admin_user) { create(:admin_user, type: 'Admin') }

        run_test!
      end
    end
  end

  path '/api/books/{id}' do
    parameter name: 'access-token', in: :header, type: :string, description: 'Access Token'
    parameter name: 'uid', in: :header, type: :string, description: 'Uid'
    parameter name: 'client', in: :header, type: :string, description: 'client'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    let(:current_user) { admin_user }
    let(:auth_headers) { current_user.create_new_auth_token }
    let('access-token') { auth_headers['access-token'] }
    let(:uid) { auth_headers['uid'] }
    let(:client) { auth_headers['client'] }

    let(:book) { create(:book) }
    let(:id) { book.id }

    get('show book') do
      tags 'Books'
      produces 'application/json'

      response 200, 'successful' do
        let(:admin_user) { create(:admin_user, type: 'User') }
        schema '$ref' => '#/components/schemas/book'

        run_test!
      end

      response 403, 'forbidden' do
        let(:admin_user) { create(:admin_user, type: 'Admin') }

        run_test!
      end
    end

    patch('update book') do
      tags 'Books'
      consumes 'application/json'
      produces 'application/json'

      parameter name: 'params', in: :body, schema: { '$ref' => '#/components/schemas/book_params' }

      let(:params) do
        {
          book: {
            name: Faker::Book.title,
            price: Faker::Number.between(from: 1, to: 1000)
          }
        }
      end

      response 200, 'successul' do
        let(:admin_user) { create(:admin_user, type: 'User') }
        schema '$ref' => '#/components/schemas/book'

        run_test!
      end

      response 403, 'forbidden' do
        let(:admin_user) { create(:admin_user, type: 'Admin') }

        run_test!
      end
    end

    delete('delete book') do
      tags 'Books'

      response 200, 'successful' do
        let(:admin_user) { create(:admin_user, type: 'User') }

        run_test!
      end

      response 403, 'forbidden' do
        let(:admin_user) { create(:admin_user, type: 'Admin') }

        run_test!
      end
    end
  end
end
