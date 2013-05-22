class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

  has_many :connections, :dependent => :destroy
  has_many :reviews

  def second_level
    second_level = Array.new
    self.connections.each do |c|
      c.connection.connections.each do |second|
        second_level << second.connection
      end
    end
    return second_level
  end

  def nth_level(level, array = Array.new, connections=self.connections)
    level = level - 1
    connections.each do |c|
      if level == 0
        array << c.connection
      else
        nth_level(level, array, c.connection.connections)
      end
    end
    return array
  end

end
