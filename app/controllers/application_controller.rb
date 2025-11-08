# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Prevent CSRF attacks by raising an exception for unverified requests
  protect_from_forgery with: :exception

  # Set security headers
  before_action :set_security_headers

  helper_method :current_user, :logged_in?

  private

  def current_user
    return @current_user if defined?(@current_user)
    
    if session[:user_id]
      user = User.find_by(id: session[:user_id])
      
      # Validate session token to ensure session is still valid
      if user && session[:session_token] == user.session_token
        @current_user = user
      else
        # Session token mismatch - password was changed on another device
        reset_session
        @current_user = nil
      end
    end
    
    @current_user
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    unless logged_in?
      redirect_to login_path, alert: "Please log in to continue."
    end
  end

  def set_security_headers
    # Prevent clickjacking attacks
    response.headers['X-Frame-Options'] = 'DENY'
    
    # Prevent MIME type sniffing
    response.headers['X-Content-Type-Options'] = 'nosniff'
    
    # Enable XSS protection (legacy browsers)
    response.headers['X-XSS-Protection'] = '1; mode=block'
    
    # Enforce HTTPS in production
    response.headers['Strict-Transport-Security'] = 'max-age=31536000; includeSubDomains' if Rails.env.production?
    
    # Prevent information disclosure
    response.headers['X-Powered-By'] = 'TaskManager'
  end
end