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

  # def get_connections_by_level(level)
  #   self.nth_level(level).map {|user| user.name.capitalize}.join(' ')
  # end

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
    one = self.nth_level(1).uniq.map{|user| user.name}
    two = self.nth_level(2).uniq.map{|user| user.name}
    three = self.nth_level(3).uniq.map{|user| user.name}
    two.reject! {|n| one.include?(n)}
    two.reject! {|n| self.name == n}
    three.reject! {|n| two.include?(n)}
    three.reject! {|n| one.include?(n)}
    three.reject! {|n| self.name == n}
    users = {:level1 => one , :level2 => two, :level3 => three}
  end

end
