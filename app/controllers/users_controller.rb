class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_path, :notice => notify(:signed_up)
    else
      render :new
    end
  end

  def index
  end

  def current
    @user = current_user
    @email = @user.nil? ? "no user" : @user.email
    respond_to do |f|
      f.html
      f.json {render :json => @user.to_json}
    end 
  end

end
