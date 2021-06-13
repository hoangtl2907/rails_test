# frozen_string_literal: true

module Api
  class BooksController < ApiController
    before_action :set_book, only: %w[show edit update destroy]

    def index
      authorize Book

      service = Search::BooksService.new(query_params)
      books = service.execute

      render json: books, each_serializer: BookSerializer, status: :ok
    end

    def show
      render json: @book, serializer: BookSerializer, status: :ok
    end

    def create
      book = Book.create(book_params)

      if book.errors.present?
        render_error_response(book.errors.full_messages)
      else
        render json: book, serializer: BookSerializer, status: :created
      end
    end

    def update
      @book.update(book_params)

      if @book.errors.present?
        render_error_response(@book.errors.full_messages)
      else
        render json: book, serializer: BookSerializer, status: :ok
      end
    end

    def destroy
      @book.destroy

      render json: 'OK', status: :ok
    end

    private

    def set_book
      @book = Book.find_by(id: params[:id])
    end

    def book_params
      params.require(:book).permit(
        :name, :price
      )
    end

    def query_params
      params.permit(:q, :o, :d, :page)
    end
  end
end
