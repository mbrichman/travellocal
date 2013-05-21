class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :category
      t.integer :place_id
      t.text :review_text
      t.date :review_date
      t.integer :user_id

      t.timestamps
    end
  end
end
