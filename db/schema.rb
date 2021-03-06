# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130624174023) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "connections", :force => true do |t|
    t.integer  "user_id"
    t.integer  "connection_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "favorites", :force => true do |t|
    t.integer  "user_id"
    t.integer  "place_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "places", :force => true do |t|
    t.integer  "city_id"
    t.string   "name"
    t.string   "address"
    t.string   "url"
    t.string   "neighborhood"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "category_id"
    t.string   "description"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

  create_table "recommendation_requests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "city_id"
    t.text     "description"
    t.integer  "friend_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "recommendations", :force => true do |t|
    t.integer  "rr_id"
    t.integer  "user_id"
    t.integer  "place_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "comment"
  end

  create_table "reviews", :force => true do |t|
    t.string   "category"
    t.integer  "place_id"
    t.text     "review_text"
    t.date     "review_date"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "search_suggestions", :force => true do |t|
    t.string   "term"
    t.integer  "popularity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trip_places", :force => true do |t|
    t.integer  "trip_id"
    t.integer  "place_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trips", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "city_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "name"
    t.integer  "city_id"
  end

  create_table "wishlists", :force => true do |t|
    t.integer  "user_id"
    t.integer  "place_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
