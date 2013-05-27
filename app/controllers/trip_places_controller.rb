class TripPlacesController < ApplicationController
  def new
    @trip_place = TripPlace.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  def create
      @trip_place = TripPlace.new
      @trip_place.place_id = params[:place_id]
      @trip_place.trip_id = Trip.where(user_id: current_user.id, city_id: params[:city_id]).first.id

    respond_to do |format|
      if @trip_place.save
        format.html { redirect_to places_url, notice: 'Trip was successfully created.' }
        format.json { render json: @trip_place, status: :created, location: @trip_place }
      else
        format.html { render action: "new" }
        format.json { render json: @trip_place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @trip_place = Trip.find(params[:id])
    @trip_place.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end

  end
end
