class ApplicationController < ActionController::Base
 
 
 
 
 
 
  # before_action :basic_auth
  # private

  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == 'admin' && password == '2222'
  #   end
  # end
  # basic認証についての記述


  before_action :configure_permitted_parameters, if: :devise_controller?
  #  before_action :authenticate_user!
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_huri, :last_name_huri, :birthday])
  end
end

