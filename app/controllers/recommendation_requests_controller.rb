class RecommendationRequestsController < ApplicationController
  # GET /recommendation_requests
  # GET /recommendation_requests.json
  def index
    @recommendation_requests = RecommendationRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recommendation_requests }
    end
  end

  # GET /recommendation_requests/1
  # GET /recommendation_requests/1.json
  def show
    @recommendation_request = RecommendationRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recommendation_request }
    end
  end

  # GET /recommendation_requests/new
  # GET /recommendation_requests/new.json
  def new
    @recommendation_request = RecommendationRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recommendation_request }
    end
  end

  # GET /recommendation_requests/1/edit
  def edit
    @recommendation_request = RecommendationRequest.find(params[:id])
  end

  # POST /recommendation_requests
  # POST /recommendation_requests.json
  def create
    @recommendation_request = RecommendationRequest.new
    @recommendation_request.city_id = params[:city_id]
    @recommendation_request.user_id = current_user.id
    @recommendation_request.description = params[:description]
    @recommendation_request.friend_id = params[:friend_ids][0]

    respond_to do |format|
      if @recommendation_request.save
        format.html { redirect_to @recommendation_request, notice: 'Recommendation request was successfully created.' }
        format.json { render json: @recommendation_request, status: :created, location: @recommendation_request }
      else
        format.html { render action: "new" }
        format.json { render json: @recommendation_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recommendation_requests/1
  # PUT /recommendation_requests/1.json
  def update
    @recommendation_request = RecommendationRequest.find(params[:id])

    respond_to do |format|
      if @recommendation_request.update_attributes(params[:recommendation_request])
        format.html { redirect_to @recommendation_request, notice: 'Recommendation request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recommendation_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recommendation_requests/1
  # DELETE /recommendation_requests/1.json
  def destroy
    @recommendation_request = RecommendationRequest.find(params[:id])
    @recommendation_request.destroy

    respond_to do |format|
      format.html { redirect_to recommendation_requests_url }
      format.json { head :no_content }
    end
  end

  def add_to_trip
    city = City.find(parms[:city_id])
    t = Trip.create(name: city.name, start_date: Date.today + 30, end_date: Date.today + 37 )

    redirect_to trips_path
  end
end
