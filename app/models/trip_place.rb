class TripPlace < ActiveRecord::Base
  attr_accessible :place_id, :trip, :trip_id
  belongs_to :trip
  belongs_to :place
end
