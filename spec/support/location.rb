def fill_in_location(lat,lon,acc)
  fill_in "Latitude", :with => lat
  fill_in "Longitude", :with => lon
  fill_in "Accuracy", :with => acc
end
