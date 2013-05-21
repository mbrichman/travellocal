class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :city_id
      t.string :name
      t.string :address
      t.string :url
      t.string :neighborhood

      t.timestamps
    end
  end
end
