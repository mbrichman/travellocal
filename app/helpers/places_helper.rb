module PlacesHelper
  def friends_fave
    current_user.friends.map {|f| @place.is_favorite?(f).capitalize}
  end
end
