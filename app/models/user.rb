class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation, :city_id

  validates   :name, :email, presence: true
  validates   :email, uniqueness: true

  has_many    :connections, :dependent => :destroy
  has_many    :reviews
  has_many    :trips, :dependent => :destroy
  has_many    :favorites, :dependent => :destroy
  has_many    :authentications
  belongs_to  :city
  has_many    :wishlists, :dependent => :destroy

  before_save :downcase_input

  def all_faves
    recommendations = self.favorites.map {|fave| fave.place}
    recommendations << self.wishlists.map {|wish| wish.place}
    recommendations = recommendations.flatten.sort.each do |r|
      r.name = r.name.titleize
    end
  end

  def friends
    self.nth_level(1)
  end

  def friends_reviews
    # @reviews = self.nth_level(1).map {|user| user.reviews.map {|review| review.place}}.flatten.uniq{|place| place.id}
    friend_ids = friends.map {|u| u.id }
    @user_reviews = Review.where(:user_id => friend_ids).group_by(&:place_id)

  end
  def friends_favorites
    @favorites = User.first.nth_level(1).map {|u| u.favorites.map {|f| f.place}}.flatten
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
    return array.uniq
  end

  def get_connections_by_level(level)
    self.nth_level(level).map {|user| user.name.capitalize}.join(' ')
  end

  def clean_connections
    network = Array.new
    two = Array.new
    three = Array.new
    self.connections.each do |first|
      network << {1 => first.user_connection }
      first.user_connection.connections.each do |second|
        network << {2 => second.user_connection}
        second.user_connection.connections.each do |third|
          network << {3 => third.user_connection}
        end
      end
    end
    level1 = network.select {|n| n[1]}.uniq.map{|n| n[1]}
    level2 = network.select {|n| n[2]}.uniq.map{|n| n[2]}
    level3 = network.select {|n| n[3]}.uniq.map{|n| n[3]}
    level2.reject! {|n| level1.include?(n)}
    level2.reject! {|n| self.name == n}
    level3.reject! {|n| level2.include?(n)}
    level3.reject! {|n| level1.include?(n)}
    level3.reject! {|n| self.name == n}
    @users = [{:level1 => level1 }, {:level2 => level2}, {:level3 => level3}]
  end

end
