# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :signed_in?
  
    def sign_in(user)
      user.update(remember_token: SecureRandom.urlsafe_base64)
      cookies.permanent.signed[:remember_token] = user.remember_token
    end
  
    def sign_out
      current_user.update(remember_token: nil)
      cookies.delete(:remember_token)
    end
  
    def current_user
      @current_user ||= User.find_by(remember_token: cookies.signed[:remember_token])
    end
  
    def signed_in?
      !current_user.nil?
    end
  end
  
