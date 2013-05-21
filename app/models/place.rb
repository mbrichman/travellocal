class Place < ActiveRecord::Base
  attr_accessible :address, :city_id, :name, :neighborhood, :url
  belongs_to :city
  has_many :reviews
end
