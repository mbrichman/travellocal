class City < ActiveRecord::Base
  attr_accessible :name
  has_many :places

  before_save :downcase_form_input

  def downcase_form_input
    self.name = self.name.downcase
  end

end
