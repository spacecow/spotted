require 'spec_helper'

def controller_actions(controller)
  Rails.application.routes.routes.inject({}) do |hash, route|
    hash[route.requirements[:action]] = route.verb.downcase if route.requirements[:controller] == controller && !route.verb.nil?
    hash
  end
end

describe UsersController do
  controller_actions = controller_actions("users")

  before(:each) do
    @model = create_user
  end

  describe "a user is not logged in" do
    controller_actions.each do |action,req|
      if %w(new create).include?(action) 
        it "should reach the #{action} page" do
          send(req,action,:id => @model.id)
          response.redirect_url.should_not eq(login_url)
        end
      else
        it "should not reach the #{action} page" do
          send(req,action,:id => @model.id)
          response.redirect_url.should eq(login_url)
        end
      end
    end
  end

  describe "a user is logged in" do
    before(:each) do
      @user = create_user 
      session[:userid] = @user.id
    end

    controller_actions.each do |action,req|
      if %w(current).include?(action) 
        it "should reach the #{action} page" do
          send(req,action,:id => @model.id)
          response.redirect_url.should_not eq(welcome_url)
        end
      elsif %w(show).include?(action) 
        it "should reach the own #{action} page" do
          send(req,action,:id => @user.id)
          response.redirect_url.should_not eq(welcome_url)
        end
        it "should not reach another user's #{action} page" do
          send(req,action,:id => @model.id)
          response.redirect_url.should eq(welcome_url)
        end
      else
        it "should not reach the #{action} page" do
          send("#{req}", "#{action}", :id => @model.id)
          response.redirect_url.should eq(welcome_url)
        end
      end
    end
  end

  describe "an admin is logged in" do
    before(:each) do
      session[:userid] = create_miniadmin.id
    end

    controller_actions.each do |action,req|
      if %w(index current show).include?(action) 
        it "should reach the #{action} page" do
          send(req,action,:id => @model.id)
          response.redirect_url.should_not eq(welcome_url)
        end
      else
        it "should not reach the #{action} page" do
          send(req,action,:id => @model.id)
          response.redirect_url.should eq(welcome_url)
        end
      end
    end
  end

  describe "an admin is logged in" do
    before(:each) do
      session[:userid] = create_admin.id
    end

    controller_actions.each do |action,req|
      if %w(index destroy current show).include?(action) 
        it "should reach the #{action} page" do
          send(req,action,:id => @model.id)
          response.redirect_url.should_not eq(welcome_url)
        end
      else
        it "should not reach the #{action} page" do
          send(req,action,:id => @model.id)
          response.redirect_url.should eq(welcome_url)
        end
      end
    end
  end
end
