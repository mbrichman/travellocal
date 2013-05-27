class CreateTripPlaces < ActiveRecord::Migration
  def change
    create_table :trip_places do |t|
      t.integer :trip_id
      t.integer :place_id

      t.timestamps
    end
  end
end
