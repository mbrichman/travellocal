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
  has_many    :recommendation_requests


  before_save :downcase_input

  def all_faves
    recommendations = self.favorites.map {|fave| fave.place}
    recommendations << self.wishlists.map {|wish| wish.place}
    recommendations = recommendations.flatten.sort.each do |r|
      r.name = r.name.titleize
    end
  end

  def friends
    self.nth_level(1).uniq
  end

  def friends_reviews
    # @reviews = self.nth_level(1).map {|user| user.reviews.map {|review| review.place}}.flatten.uniq{|place| place.id}
    friend_ids = friends.map {|u| u.id }
    @user_reviews = Review.where(:user_id => friend_ids).group_by(&:place_id)
  end

  def friends_favorites
    # @favorites = User.first.nth_level(1).map {|u| u.favorites.map {|f| f.place}}.flatten
    friend_ids = friends.map {|u| u.id }
    favorites = Favorite.where(:user_id => friend_ids).group_by(&:place_id)

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
    if level == 1
      self.clean_connections[:level1]
    elsif level == 2
      self.clean_connections[:level2]
    elsif level == 3
      self.clean_connections[:level3]
    end
  end

  def clean_connections
    level1 = self.nth_level(1).uniq.map{|user| user.name}
    level2 = self.nth_level(2).uniq.map{|user| user.name}
    level3 = self.nth_level(3).uniq.map{|user| user.name}
    level2.reject! {|n| level1.include?(n)}
    level2.reject! {|n| self.name == n}
    level3.reject! {|n| level2.include?(n)}
    level3.reject! {|n| level1.include?(n)}
    level3.reject! {|n| self.name == n}
    users = {:level1 => level1 , :level2 => level2, :level3 => level3}
  end

  def find_level(user)
    @level1 = self.nth_level(1).uniq
    @level2 = self.nth_level(2).uniq
    @level3 = self.nth_level(3).uniq
    if @level1.include?(user)
      return "1st"
    elsif @level2.include?(user)
      return "2nd"
    elsif @level3.include?(user)
      return "3rd"
    else
      return 'Not in Network'
    end
  end

  def play
    @level1 = self.nth_level(1).uniq.map{|user| user.name}
    @level2 = self.nth_level(2).uniq.map{|user| user.name}
    @level3 = self.nth_level(3).uniq.map{|user| user.name}
    levels = [@level1 , @level2, @level3]
    levels.each_with_index do |array, i|
      if i == 1
      else
        array.reject! {|n| levels[i-1].include?(n)}
        array.reject! {|n| self.name == n}
      end
    end
    return levels
  end

end
