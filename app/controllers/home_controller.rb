class HomeController < ApplicationController
  def index
    @city = City.new
  end
end
