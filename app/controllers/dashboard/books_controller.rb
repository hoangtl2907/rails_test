# frozen_string_literal: true

module Dashboard
  class BooksController < BaseController
    include OrderHelper

    before_action :set_book, only: %w[show edit update destroy]
    helper_method :order_params

    def index
      service = Search::BooksService.new(query_params)
      @books = service.execute
    end

    def show; end

    def new
      @book = Book.new
    end

    def create
      book = Book.create(book_params)

      if book.errors.present?
        flash[:errors] = book.errors.full_messages
        redirect_to action: :new
      else
        redirect_to action: :index
      end
    end

    def edit; end

    def update
      @book.update(book_params)

      if @book.errors.present?
        flash[:errors] = @book.errors.full_messages
        redirect_to action: :edit
      else
        redirect_to action: :index
      end
    end

    def destroy
      @book.destroy

      redirect_to action: :index
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
