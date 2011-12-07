class Location < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :latitude, :longitude, :horizontal_accuracy
end
