class CreateRecommendationRequests < ActiveRecord::Migration
  def change
    create_table :recommendation_requests do |t|
      t.integer :user_id
      t.integer :city_id
      t.text :description
      t.integer :friend_id

      t.timestamps
    end
  end
end
