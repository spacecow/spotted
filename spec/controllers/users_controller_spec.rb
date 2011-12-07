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
    @model = Factory(:user)
  end

  describe "a user is not logged in" do
    controller_actions.each do |action,req|
      if %w(new create index).include?(action) 
        it "should reach the #{action} page" do
          send("#{req}", "#{action}", :id => @model.id)
          response.redirect_url.should_not eq(login_url)
        end
      else
        it "should not reach the #{action} page" do
          send("#{req}", "#{action}", :id => @model.id)
          response.redirect_url.should eq(login_url)
        end
      end
    end
  end

  describe "a user is logged in" do
    before(:each) do
      session[:userid] = @model.id
    end

    controller_actions.each do |action,req|
      it "should reach the #{action} page" do
        send("#{req}", "#{action}", :id => @model.id)
        response.redirect_url.should_not eq(login_url)
      end
    end
  end
end
