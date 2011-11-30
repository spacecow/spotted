require 'spec_helper'

describe "Users" do
  describe "current" do
    it "no user logged in" do
      visit current_users_path
      page.should have_content("no user")
    end

    it "display user if logged in" do
      Factory(:user)
      login
      visit current_users_path
      page.should have_content("test@example.com")
    end
  end
end
