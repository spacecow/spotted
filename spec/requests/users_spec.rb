require 'spec_helper'

describe "Users" do
  describe "current" do
    it "display user if logged in" do
      Factory(:user, :email => "test@example.com")
      login("test@example.com")
      visit current_users_path
      page.should have_content("test@example.com")
    end
  end
end
