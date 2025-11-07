class PagesController < ApplicationController
  def home
    if logged_in?
      redirect_to todos_path
    else
      render :home
    end
  end
end
