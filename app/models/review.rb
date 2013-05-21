class Review < ActiveRecord::Base
  attr_accessible :category, :place_id, :review_date, :review_text, :user_id
  belongs_to :place
end
