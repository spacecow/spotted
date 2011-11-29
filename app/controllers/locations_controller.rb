class LocationsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @location = @user.locations.build
  end

  def create
    @user = User.find(params[:user_id])
    @location = @user.locations.new(params[:location])
    if @location.save
      redirect_to @user 
    else
      render :new
    end
  end
end
