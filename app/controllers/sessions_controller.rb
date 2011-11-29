class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email],params[:password])
    if user
      session[:userid] = user.id
      redirect_to root_path, :notice => notify(:logged_in) 
    else
      flash.now.alert = alert(:invalid_email_or_password) 
      render :new
    end
  end

  def destroy
    session[:userid] = nil
    redirect_to root_path, :notice => notify(:logged_out) 
  end
end
