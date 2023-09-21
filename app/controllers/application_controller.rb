class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :html, :json
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :email, :password, :password_confirmation)
    end
  end

  def after_sign_out_path_for(_resource_or_scope)
    splashes_path
  end
  def after_sign_in_path_for(_resource_or_scope)
    user_groups_path(user_id: current_user.id)
  end
end
