class UsersController < ApplicationController
  before_action :require_login, only: [ :edit, :update ]
  before_action :set_user, only: [ :edit, :update ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Regenerate session to prevent session fixation
      reset_session
      session[:user_id] = @user.id
      session[:session_token] = @user.session_token
      redirect_to todos_path, notice: "Welcome to TaskManager, #{@user.name || @user.email}! Start adding your todos below."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    # Check if password is being changed
    password_changing = params[:user][:password].present?

    # Only allow password update if current password is confirmed
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    # Prevent email changes to different existing emails (account takeover prevention)
    if params[:user][:email] && params[:user][:email] != @user.email
      existing_user = User.find_by("lower(email) = ?", params[:user][:email].downcase.strip)
      if existing_user && existing_user.id != @user.id
        @user.errors.add(:email, "is already taken")
        render :edit, status: :unprocessable_entity
        return
      end
    end

    if @user.update(user_params)
      # If password was changed, regenerate session token to log out other devices
      if password_changing
        @user.regenerate_session_token
        session[:session_token] = @user.session_token
        redirect_to todos_path, notice: "Profile updated successfully. All other devices have been logged out for security."
      else
        redirect_to todos_path, notice: "Profile updated successfully."
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar_url)
  end
end
