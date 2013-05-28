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

  before_save :downcase_input

  def has_trip_to_city(city_id)
    Trip.find_by_user_id(self.id).try(:city_id) == city_id
  end

  def downcase_input
    self.name = self.name.downcase
    self.email = self.email.downcase
  end

  def second_level
    second_level = Array.new
    self.connections.each do |c|
      c.user_connection.connections.each do |second|
        second_level << second.user_connection
      end
    end
    return second_level
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
