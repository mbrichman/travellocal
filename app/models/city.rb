class City < ActiveRecord::Base
  attr_accessible :name
  has_many :places

  before_save :downcase_form_iput

  def downcase_form_input
    name = name.downcase
  end

end
