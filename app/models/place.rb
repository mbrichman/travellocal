class Place < ActiveRecord::Base
  attr_accessible :address, :city_id, :name, :neighborhood, :url
  belongs_to :city
  has_many :reviews

  validates :address, :city_id, :name, :neighborhood, presence: true

  before_save :downcase_form_input

  def downcase_form_input
    self.neighborhood = self.neighborhood.downcase
    self.name = self.name.downcase
    self.address = self.address.downcase
  end



  def self.search(search)
    if search
      find(:all, :conditions => ['neighborhood LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
