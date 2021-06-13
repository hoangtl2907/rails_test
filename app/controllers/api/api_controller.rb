# frozen_string_literal: true

module Api
  class ApiController < ::ApplicationController
    include DeviseTokenAuth::Concerns::SetUserByToken
    include Pundit

    before_action :authenticate_admin_user!

    rescue_from Pundit::NotAuthorizedError, with: :render_not_authorized

    def current_user
      current_admin_user
    end

    def render_error_response(errors)
      render json: { errors: errors }, status: :unprocessable_entity
    end

    def render_not_authorized
      render json: { errors: "You don't have permission to take this action" }, status: :forbidden
    end
  end
end
