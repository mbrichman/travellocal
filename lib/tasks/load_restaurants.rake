desc "Load Chicago Restaurants"
task :load_chicago => :environment do
  require 'open-uri'
  url = "http://opentable.heroku.com/api/restaurants?city=chicago"
  result = JSON.parse(open(url).read)
  result['restaurants'].each do |restaurant|
    r = Place.new
    r.name = restaurant['name']
    r.category_id = 2
    r.address = restaurant['address']
    r.city_id = 1
    r.neighborhood = 'chicago'

    if r.save
      puts "#{r.name} was created"
    end
  end
end
