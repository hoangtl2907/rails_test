{
  openapi: '3.0.1',
  info: {
    title: 'API V1',
    version: 'v1'
  },
  components: {
    schemas: {
      book: {
        type: :object,
        properties: {
          id: { type: :integer },
          name: { type: :string },
          price: { type: :integer },
          created_at: { type: :string },
          updated_at: { type: :string }
        },
        required: %w[id name price created_at updated_at]
      },
      books: {
        type: :array,
        items: {
          '$ref' => '#/components/schemas/book'
        }
      },
      book_params: {
        type: :object,
        properties: {
          book: {
            type: :object,
            properties: {
              name: { type: :string },
              price: { type: :integer }
            },
            required: %w[name price]
          }
        }
      }
    }
  }
}
