require 'spec_helper'

describe "Locations" do
  describe "get" do
    before(:each) do
      @user = Factory(:user)
    end

    context "errors" do
      before(:each) do
        visit new_user_location_path(@user)
      end

      it "latitude cannot be empty" do
        lambda do
          fill_in "Latitude", :with => ""
          click_button "Create Location" 
        end.should change(Location, :count).by(0)
        li(:latitude).should have_error("can't be blank")
      end

      it "longitude cannot be empty" do
        lambda do
          fill_in "Longitude", :with => ""
          click_button "Create Location"
        end.should change(Location, :count).by(0)
        li(:longitude).should have_error("can't be blank")
      end
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
