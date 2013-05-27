class Favorite < ActiveRecord::Base
  attr_accessible :place_id, :user_id

  validates :place_id, :uniqueness => { scope: :user_id, message: 'That place is already a favorite.' }
end
