module FavoritesHelper
  def my_favorites
    current_user.favorites.map {|fave| fave.place}
  end
end
