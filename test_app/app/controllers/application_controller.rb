class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password,
      :password_confirmation, :remember_me, :avatar) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password,
      :password_confirmation, :current_password, :avatar) }
  end
end
