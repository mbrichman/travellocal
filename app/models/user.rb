class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation, :city_id

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  has_many :connections, :dependent => :destroy
  has_many :reviews
  has_many :trips, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  has_many :authentications
  belongs_to  :city
  has_many :wishlists, :dependent => :destroy

  before_save :downcase_input

  def all_faves
    recommendations = self.favorites.map {|fave| fave.place}
    recommendations << self.wishlists.map {|wish| wish.place}
    recommendations = recommendations.flatten.sort.each do |r|
      r.name = r.name.titleize
    end
  end

  def friends
    self.connections.map {|friend| friend.user_connection}
  end

  def friends_favorites
    @favorites = Array.new
    self.friends.each do |friend|
      places = User.find(friend).favorites.map {|p| p.place.id }
      @favorites << { :user => friend.id, :places => places }
    end
    # returns array of hashes [ { :user => friend1, places => [place1, place2] }
    return @favorites

  end

  def last_trip
    self.trips.last
  end

  def has_trip_to_city(city_id)
    Trip.where(user_id: self.id, city_id: city_id)
  end

  def downcase_input
    self.name = self.name.downcase
    self.email = self.email.downcase
  end

  def nth_level(level, array = Array.new, connections=self.connections)
    level = level - 1
    connections.each do |c|
      if level == 0
        array << c.user_connection
      else
        nth_level(level, array, c.user_connection.connections)
      end
    end
    return array
  end

  def get_connections_by_level(level)
    self.nth_level(level).map {|user| user.name.capitalize}.join(' ')
  end

end
