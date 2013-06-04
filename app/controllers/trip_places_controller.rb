class TripPlacesController < ApplicationController
  def new
    @trip_place = TripPlace.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  def create

      #check if trip already exists to the city. If not create it
      #add the place to the trip
      trip = Trip.find_or_create_by_user_id_and_city_id(
              user_id: current_user.id,
              city_id: params[:city_id],
              name: City.find_by_id(params[:city_id]).name,
              start_date: Date.tomorrow,
              end_date: Date.tomorrow + 1
              )
      @trip_place = TripPlace.new
      @trip_place.place_id = params[:place_id]
      @trip_place.trip_id = trip.id

    respond_to do |format|
      if @trip_place.save
        @places = Place.all
        format.html { redirect_to trip_path(@trip_place.trip_id), notice: 'The place has been added to your trip' }
        format.json { render json: @trip_place, status: :created, location: @trip_place }
      else
        format.html { render action: "new" }
        format.json { render json: @trip_place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @trip_place = TripPlace.find(params[:id])
    trip_id = TripPlace.find(params[:id]).trip_id
    @trip_place.destroy

    respond_to do |format|
      format.html { redirect_to trip_path(trip_id) }
      format.json { head :no_content }
    end

  end
end
