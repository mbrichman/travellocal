class FavoritesController < ApplicationController

  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = Favorite.search(params[:search])

    respond_to do |format|
      format.html { render 'users/show'}
      format.json { render json: @favorites }
    end
  end

  # GET /favorites/1
  # GET /favorites/1.json
  def show
    @favorite = Favorite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @favorite }
    end
  end

  # GET /favorites/new
  # GET /favorites/new.json
  def new
    @favorite = Favorite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @favorite }
    end
  end

  # GET /favorites/1/edit
  def edit
    @favorite = Favorite.find(params[:id])
  end

  # POST /favorites
  # POST /favorites.json
  def create
    @favorite = Favorite.new(place_id: params[:place_id], user_id: current_user.id)

    respond_to do |format|
      if @favorite.save
        format.js
        format.html { redirect_to places_path, notice: 'Favorite was successfully added.' }
        format.json { render json: @favorite, status: :created, location: @favorite }
      else
        @places = Place.all
        format.html { render 'places/index' }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /favorites/1
  # PUT /favorites/1.json
  def update
    @favorite = Favorite.find(params[:id])

    respond_to do |format|
      if @favorite.update_attributes(params[:place])
        format.html { redirect_to @favorite, notice: 'Place was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user.id) }
      format.json { head :no_content }
    end
  end

end
