class SessionsController < ApplicationController
  before_filter :basic_authentication, :only => :iphone

  def new
  end

  def create
    user = User.authenticate(params[:email],params[:password])
    if user
      session_userid(user.id)
      redirect_to root_path, :notice => notify(:logged_in) 
    else
      flash.now.alert = alert(:invalid_email_or_password) 
      render :new
    end
  end

  def destroy
    session_userid(nil)
    redirect_to root_path, :notice => notify(:logged_out) 
  end

  def iphone
    if @user
      redirect_to root_path
    end
  end
end
