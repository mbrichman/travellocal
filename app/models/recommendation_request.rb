class RecommendationRequest < ActiveRecord::Base
  attr_accessible :city_id, :description, :user_id, :friend_id
  has_many :recommendations, class_name: 'Recommendation', foreign_key: 'rr_id', dependent: :destroy
  belongs_to :user
  belongs_to :city
end
