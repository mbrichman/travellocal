class Connection < ActiveRecord::Base
  attr_accessible :connection_id, :user_id

  belongs_to      :user
  belongs_to      :user_connection, class_name: 'User'
end
