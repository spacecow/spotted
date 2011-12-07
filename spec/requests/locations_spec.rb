require 'spec_helper'

describe "Locations" do
  describe "get" do
    before(:each) do
      @user = Factory(:user)
    end

    context "create a new location" do
      before(:each) do
        visit new_user_location_path(@user)
        fill_in_location("38.2642988","140.8691532","100")
      end

      it "adds a new location" do
        lambda do 
          click_button("Create Location")
        end.should change(Location, :count).by(1)
      end

      it "adds latitude" do
        click_button("Create Location")
        Location.last.latitude.should == 38.2642988
      end

      it "adds longitude" do
        click_button("Create Location")
        Location.last.longitude.should == 140.8691532
      end

      it "adds accuracy" do
        click_button("Create Location")
        Location.last.horizontal_accuracy.should eq 100.0
      end

      it "latitude cannot be blank" do
        lambda do
          fill_in "Latitude", :with => ""
          click_button "Create Location" 
        end.should change(Location, :count).by(0)
        li(:latitude).should have_blank_error
      end

      it "longitude cannot be blank" do
        lambda do
          fill_in "Longitude", :with => ""
          click_button "Create Location"
        end.should change(Location, :count).by(0)
        li(:longitude).should have_blank_error
      end

      it "accuracy cannot be blank" do
        lambda do
          fill_in "Accuracy", :with => ""
          click_button "Create Location"
        end.should change(Location, :count).by(0)
        li(:accuracy).should have_blank_error
      end
    end
  end
end
