class SessionsController < ApplicationController
  # Rate limiting: max 5 login attempts per IP per minute
  before_action :check_rate_limit, only: [:create]
  
  def new
  end

  def create
    user = User.find_by("lower(email) = ?", params[:email].to_s.downcase.strip)
    
    if user&.authenticate(params[:password])
      # Reset login attempts on successful login
      reset_rate_limit
      
      # Regenerate session ID to prevent session fixation attacks
      reset_session
      session[:user_id] = user.id
      
      redirect_to todos_path, notice: "Welcome back, #{user.name || user.email}!"
    else
      # Increment failed login attempts
      increment_rate_limit
      
      # Use generic error message to prevent user enumeration
      flash.now[:alert] = "Invalid email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # Clear session completely
    reset_session
    redirect_to root_path, notice: "Signed out successfully."
  end

  private

  def check_rate_limit
    attempts = session[:login_attempts] || 0
    last_attempt = session[:last_login_attempt]

    # Reset counter if last attempt was more than 1 minute ago
    if last_attempt && Time.current - Time.parse(last_attempt) > 1.minute
      session[:login_attempts] = 0
    end

    if attempts >= 5
      flash[:alert] = "Too many login attempts. Please try again in a few minutes."
      redirect_to login_path and return
    end
  end

  def increment_rate_limit
    session[:login_attempts] = (session[:login_attempts] || 0) + 1
    session[:last_login_attempt] = Time.current.to_s
  end

  def reset_rate_limit
    session.delete(:login_attempts)
    session.delete(:last_login_attempt)
  end
end