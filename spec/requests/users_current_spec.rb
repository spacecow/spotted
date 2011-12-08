require 'spec_helper'

describe "Users" do
  describe "current" do
    it "display user if logged in" do
      create_user("test")
      login("test")
      visit current_users_path
      page.should have_content("test")
    end
  end
end
