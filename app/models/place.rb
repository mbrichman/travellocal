class Place < ActiveRecord::Base
  attr_accessible :address, :city_id, :name, :neighborhood, :url
  belongs_to :city
  has_many :reviews

  validates :address, :city_id, :name, :neighborhood, presence: true

  def self.search(search)
  if search
    find(:all, :conditions => ['neighborhood LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end
end
