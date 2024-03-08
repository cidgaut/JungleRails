class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
      if User.find_by_email(user.email)
        flash[:alert] = "Email exists in database."
        redirect_to '/signup'
      else
        flash[:alert] = "Error creating user."
        redirect_to '/signup'
      end
  end
end
