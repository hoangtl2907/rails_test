class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  include ActionController::Cookies

  def redirect_to_sign_in
    redirect_to new_dashboard_admin_user_session_path
  end
end
