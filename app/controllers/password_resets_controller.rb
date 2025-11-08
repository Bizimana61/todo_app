class PasswordResetsController < ApplicationController
  before_action :get_user, only: [ :edit, :update ]
  before_action :valid_user, only: [ :edit, :update ]
  before_action :check_expiration, only: [ :edit, :update ]

  def new
  end

  def create
    @user = User.find_by(email: params[:email].downcase.strip)
    if @user
      @user.create_reset_digest

      # Send password reset email
      begin
        UserMailer.password_reset(@user).deliver_now
        message = "Password reset instructions sent to your email"
      rescue => e
        # Log error but don't crash
        Rails.logger.error "Failed to send password reset email: #{e.message}"
        message = "Password reset link created (email service not configured)"
      end

      # In development, also show the link in the flash for testing
      if Rails.env.development?
        reset_url = edit_password_reset_url(@user.reset_token, email: @user.email)
        redirect_to root_path, notice: "#{message} (DEV: #{reset_url})"
      else
        redirect_to root_path, notice: message
      end
    else
      flash.now[:alert] = "Email address not found"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render :edit, status: :unprocessable_entity
    elsif @user.update(user_params)
      reset_session
      session[:user_id] = @user.id
      @user.update_columns(reset_digest: nil, reset_sent_at: nil)
      redirect_to todos_path, notice: "Password has been reset successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def get_user
    @user = User.find_by(email: params[:email])
    redirect_to root_path, alert: "Invalid reset link" unless @user
  end

  def valid_user
    unless @user&.authenticated?(:reset, params[:id])
      redirect_to root_path, alert: "Invalid reset link"
    end
  end

  def check_expiration
    if @user.password_reset_expired?
      redirect_to new_password_reset_path, alert: "Password reset has expired. Please request a new one."
    end
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
