class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

  has_many :connections, :dependent => :destroy
  has_many :reviews

  before_save :downcase_form_input

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
