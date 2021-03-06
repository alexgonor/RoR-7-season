class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_model!, only: [:new, :create, :edit, :update]
end
