class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :rr_id
      t.integer :user_id
      t.integer :place_id

      t.timestamps
    end
  end
end
