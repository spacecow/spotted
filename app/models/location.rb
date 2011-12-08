class Location < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :latitude, :longitude, :horizontal_accuracy
end
# == Schema Information
#
# Table name: locations
#
#  id                  :integer(4)      not null, primary key
#  latitude            :decimal(10, 7)
#  longitude           :decimal(10, 7)
#  user_id             :integer(4)
#  created_at          :datetime
#  updated_at          :datetime
#  horizontal_accuracy :float
#

