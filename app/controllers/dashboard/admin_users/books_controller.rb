# frozen_string_literal: true

module Dashboard
  module AdminUsers
    class BooksController < BaseController
      before_action :set_admin_user

      def create
        book = @admin_user.admin_users_books.create(book_id: params[:id])
        flash[:errors] = book.errors.full_messages if book.errors.present?

        redirect_to dashboard_admin_user_path(@admin_user)
      end

      def destroy
        @admin_user.admin_users_books.where(book_id: params[:id]).delete_all

        redirect_to dashboard_admin_user_path(@admin_user)
      end

      private

      def set_admin_user
        @admin_user = AdminUser.find params[:admin_user_id]
      end
    end
  end
end
