class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :position_held, :description, :user_contact_id, :email, :password, :password_confirmation, :remember_me, :picture, :picture_cache)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:name, :position_held, :description, :user_contact_id, :password, :password_confirmation, :current_password, :picture)
    end
  end
end