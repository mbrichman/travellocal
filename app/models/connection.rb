class Connection < ActiveRecord::Base
  attr_accessible :connection_id, :user_id
  validates :connection_id, :uniqueness => { scope: :user_id, message: 'You are already connected to that user.' }

  belongs_to      :user
  belongs_to      :user_connection, class_name: 'User', foreign_key: :connection_id
end
