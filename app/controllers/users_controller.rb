class UsersController < ApplicationController

before_filter :authorize_user, except: [:new, :create]

def authorize_user
  unless signed_in?
    redirect_to sessions_new_url, notice: "Please sign in to do that."
  end
end

  def connect
    @connection = Connection.new(user_id: current_user.id, connection_id: params[:connection_id])

    respond_to do |format|
      if @connection.save
        format.html { redirect_to hot_url(current_user), notice: 'Connection added.' }
        format.json { render json: @users }
      else
        @users = User.all
        format.html { render action: "index" }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.order("id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def network
    @user = User.find(params[:id])
    @users = User.all

  end
  def faves

  end
  def hot
    @user = current_user
    level1 = current_user.nth_level(1).uniq
    level2 = current_user.nth_level(2).uniq
    level3 = current_user.nth_level(3).uniq
    level2.reject! {|n| level1.include?(n)}
    level2.reject! {|n| current_user == n}
    level3.reject! {|n| level2.include?(n)}
    level3.reject! {|n| level1.include?(n)}
    level3.reject! {|n| current_user == n}
    @users = level2 + level3
  end
end
