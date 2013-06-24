class PlacesController < ApplicationController

before_filter :authorize_user, except: [:index, :show]

def authorize_user
  unless signed_in?
    redirect_to sessions_new_url, notice: "Please sign in to do that."
  end
end

  # GET /places
  # GET /places.json
  def index
    if params[:category]
      category = Category.find_by_name(params[:category])
      @places = Place.where(category_id: category).order(:name)
    else
      @places = Place.search(params[:search])
      @places.order("name")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @places }
    end
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @place = Place.find(params[:id])
    @gmaps_options = {
      "map_options" => {
        "auto_zoom" => false,
        "zoom" => 16,
        "center_latitude" => @place.latitude,
        "center_longitude" => @place.longitude
      },
      "markers" => {
        "data" => @place.to_gmaps4rails
      }
    }
    @json = @place.to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @place }
    end
  end

  # GET /places/new
  # GET /places/new.json
  def new
    @place = Place.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @place }
    end
  end

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id])
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(params[:place])

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render json: @place, status: :created, location: @place }
      else
        format.html { render action: "new" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /places/1
  # PUT /places/1.json
  def update
    @place = Place.find(params[:id])

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to places_url }
      format.json { head :no_content }
    end
  end
end
