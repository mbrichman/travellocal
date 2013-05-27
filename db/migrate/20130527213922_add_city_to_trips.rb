class AddCityToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :city_id, :integer
  end
end
