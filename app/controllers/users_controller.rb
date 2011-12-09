class UsersController < ApplicationController
  before_filter :basic_authentication, :only => :current
  load_and_authorize_resource

  def show
  end

  def index
  end

  def new
  end

  def create
    if @user.save
      redirect_to root_path, :notice => notify(:signed_up)
    else
      @user.errors_on(:name).each do |error|
        @user.errors.add(:login,error)
      end
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, :notice => deleted(:user)
  end

  def current
    @user = current_user if @user.nil?
    @name = @user.nil? ? "no user" : @user.name
    respond_to do |f|
      f.html
      f.json {render :json => @user.to_json}
    end 
  end

end
