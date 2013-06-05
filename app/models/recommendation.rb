class Recommendation < ActiveRecord::Base
  attr_accessible :place_id, :rr_id, :user_id
  belongs_to :rr, class_name: 'RecommendationRequest', foreign_key: 'rr_id'
  belongs_to :user

end
