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

ActiveRecord::Schema.define(:version => 20110208165926) do

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authors", ["name"], :name => "index_authors_on_name"

  create_table "authorships", :force => true do |t|
    t.integer  "author_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banners", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.text     "description"
    t.string   "link"
    t.boolean  "new_window"
    t.boolean  "published"
    t.string   "position"
  end

  create_table "books", :force => true do |t|
    t.string   "title"
    t.boolean  "available"
    t.text     "synopsis"
    t.string   "published_date"
    t.string   "editorial"
    t.string   "isbn"
    t.integer  "user_id"
    t.integer  "health_status"
    t.text     "health_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "offered"
    t.integer  "trade_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "isbns", :force => true do |t|
    t.string   "isbn"
    t.integer  "times_traded",  :default => 0
    t.integer  "times_created", :default => 1
    t.string   "book_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "isbns", ["isbn"], :name => "index_isbns_on_isbn"

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["permalink"], :name => "index_pages_on_permalink"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "trades", :force => true do |t|
    t.integer  "book1_id"
    t.integer  "book2_id"
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "current_state"
  end

  add_index "trades", ["book1_id", "book2_id", "user1_id", "user2_id"], :name => "index_trades_on_book1_id_and_book2_id_and_user1_id_and_user2_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "sex"
    t.string   "ocupation"
    t.text     "hobbies"
    t.string   "actual_book"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "perishable_token"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "single_access_token"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
  end

  create_table "vitamins", :force => true do |t|
    t.string   "name"
    t.string   "video_code"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
