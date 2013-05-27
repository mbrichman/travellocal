module TripPlacesHelper
  def show_trip_link(place)
    if current_user.has_trip_to_city(place.city_id)
      link_to 'Add to Trip', add_to_trip_path(place_id: place.id), method: 'post'
    end

  end
end
