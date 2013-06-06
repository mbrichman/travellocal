class Place < ActiveRecord::Base
  attr_accessible :address, :city_id, :name, :neighborhood, :url, :category_id, :description, :photo
  belongs_to :city
  has_many :reviews
  belongs_to :category
  has_attached_file :photo, :styles => { :medium => "250x250#", :thumb => "100x100" }, :default_url => "/images/:style/missing.png",
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml")

  validates :address, :city_id, :name, :neighborhood, presence: true

  before_save :downcase_form_input

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

  def is_favorite?
    Favorite.find_by_place_id_and_user_id(place_id: self.id, user_id: User.first.id)
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
