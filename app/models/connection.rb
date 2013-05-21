class Connection < ActiveRecord::Base
  attr_accessible :connection_id, :user_id

  belongs_to      :user
  belongs_to      :connection, class_name: 'User'
end
