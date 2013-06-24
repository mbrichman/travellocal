class Place < ActiveRecord::Base
  attr_accessible :address, :city_id, :name, :neighborhood, :url, :category_id, :description, :photo, :latitude, :longitude
  belongs_to :city
  has_many :reviews
  belongs_to :category
  has_attached_file :photo, :styles => { :medium => "250x250#", :thumb => "100x100" }, :default_url => "/images/:style/missing.png",
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml")

  validates :address, :city_id, :name, :neighborhood, presence: true

  before_save :downcase_form_input

  acts_as_gmappable

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    self.address
  end

  def downcase_form_input
    self.neighborhood = self.neighborhood.downcase
    self.name = self.name.downcase
    self.address = self.address.downcase
  end

  def title_name
    self.name.titleize
  end

  def self.search(search)
    if search
      where('neighborhood || name LIKE ?', "%#{search}%")
    else
      self.order("name")
    end
  end

  def is_favorite?(user)
    if Favorite.where(user_id: user.id, place_id: self.id)
      return user.name
    end
  end

  def local_fave?
    count = 0
    self.reviews.each do |review|
      if review.user.city == self.city
        count += 1
      end
    end
    count > ( self.reviews.count - count )

  end

end
