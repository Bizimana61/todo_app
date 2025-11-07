class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by("lower(email) = ?", params[:email].to_s.downcase)
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to todos_path, notice: "Welcome back, #{user.name || user.email}!"
    else
      flash.now[:alert] = "Invalid email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Signed out successfully."
  end
end