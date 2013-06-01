class Place < ActiveRecord::Base
  attr_accessible :address, :city_id, :name, :neighborhood, :url, :category_id, :description
  belongs_to :city
  has_many :reviews
  belongs_to :category

  validates :address, :city_id, :name, :neighborhood, presence: true

  before_save :downcase_form_input

  def downcase_form_input
    self.neighborhood = self.neighborhood.downcase
    self.name = self.name.downcase
    self.address = self.address.downcase
  end

  def self.search(search)
    if search
      where('neighborhood || name LIKE ?', "%#{search}%")
    else
      self.all
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
