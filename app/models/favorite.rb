class Favorite < ActiveRecord::Base
  attr_accessible :place_id, :user_id
  belongs_to :user
  belongs_to :place

  validates :place_id, :uniqueness => { scope: :user_id, message: 'That place is already a favorite.' }

  def self.search(search)
    if search
      self.inspect
      # self.place.where('name LIKE ?', "%#{search}%")
    else
      self.all
    end
  end
end
