require 'spec_helper'

describe "Locations" do
  describe "get" do
    before(:each) do
      @user = Factory(:user)
    end

    context "errors" do
      it "latitude cannot be empty"
      it "longitude cannot be empty"
    end

    context "create a new location" do
      before(:each) do
        visit new_user_location_path(@user)
      end

      it "adds a new location" do
        lambda do 
          fill_in "Latitude", :with => "38.2642988"
          fill_in "Longitude", :with => "140.8691532"
          click_button "Create Location"
        end.should change(Location, :count).by(1)
        Location.last.latitude.should == 38.2642988
        Location.last.longitude.should == 140.8691532
      end
    end
  end
end
