class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # previous user and passwords must match
    if user && user.authenticate(params[:password])
      #user info is stored in cookie
      session[:user_id] = user.id
      redirect_to '/'
    else
    # Incorrect login to redirect to new login attempt
      flash[:alert] = "Email or Password are incorrect."
      redirect_to '/login'
    end
  end

  def destroy
  end
end
