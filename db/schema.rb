# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101213235538) do

  create_table "boards", :force => true do |t|
    t.string   "title"
    t.boolean  "publish"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chats", :force => true do |t|
    t.string   "author"
    t.string   "body"
    t.integer  "board_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "content"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gallery_id"
  end

  create_table "galleries", :force => true do |t|
    t.text     "composite"
    t.text     "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "board_id"
    t.integer  "revision"
    t.integer  "totalView"
    t.string   "lastSort"
    t.integer  "recValue"
  end

  create_table "layers", :force => true do |t|
    t.integer  "board_id"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                :default => "untitled"
    t.text     "data"
    t.integer  "order"
    t.integer  "opacity",             :default => 100
    t.boolean  "visible",             :default => true
    t.datetime "last_order_update"
    t.boolean  "order_update",        :default => false
    t.datetime "last_opacity_update"
    t.boolean  "opacity_update",      :default => false
    t.datetime "last_visible_update"
    t.boolean  "visible_update",      :default => false
    t.datetime "last_data_update"
    t.boolean  "data_update",         :default => false
  end

  create_table "likes", :force => true do |t|
    t.string   "ip"
    t.integer  "gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publications", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.integer  "board_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "sessions", ["login"], :name => "index_sessions_on_login", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
