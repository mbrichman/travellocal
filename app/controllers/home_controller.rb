class HomeController < ApplicationController
  def index
    @city = City.new
    p = Place.where("places.photo_file_name IS NOT NULL")
    @places = p[0..4]
  end
end
