class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_path, notice: "Logged In"
    else
      flash.now.alert = "Couldn't sign you in. Please check your email and password." #alert immediately rather than at the next session
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path, notice: "Logged Out"
  end
end
