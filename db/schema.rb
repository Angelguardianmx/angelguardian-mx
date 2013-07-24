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

ActiveRecord::Schema.define(:version => 20130724060606) do

  create_table "crowdblog_assets", :force => true do |t|
    t.integer  "post_id"
    t.string   "attachment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "crowdblog_categories", :force => true do |t|
    t.text     "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "parent_id"
    t.boolean  "header"
    t.boolean  "footer"
  end

  create_table "crowdblog_category", :force => true do |t|
    t.text     "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "crowdblog_dod_notes", :force => true do |t|
    t.string   "title"
    t.string   "balazo"
    t.integer  "portada_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "post_id"
  end

  create_table "crowdblog_esnoticia", :force => true do |t|
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "crowdblog_home_sections", :force => true do |t|
    t.integer  "position"
    t.integer  "portada_id"
    t.string   "section_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "crowdblog_police_notes", :force => true do |t|
    t.string   "title"
    t.string   "balazo"
    t.integer  "portada_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "post_id"
  end

  create_table "crowdblog_portadas", :force => true do |t|
    t.integer  "breaking_news"
    t.date     "publication"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.text     "soundcloud_frame"
    t.boolean  "resumen_on_top"
    t.integer  "special_note_id"
    t.string   "state"
  end

  create_table "crowdblog_posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "permalink"
    t.datetime "published_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "author_id"
    t.string   "state"
    t.integer  "publisher_id"
    t.boolean  "ready_for_review"
    t.datetime "marked_for_review_at"
    t.text     "cintillo"
    t.text     "resumen"
    t.integer  "category_id"
    t.string   "filepicker_url"
    t.string   "image"
    t.integer  "related_id"
    t.boolean  "picture_only"
    t.boolean  "vlog"
    t.boolean  "opinion"
  end

  create_table "crowdblog_quote_notes", :force => true do |t|
    t.string   "quote"
    t.string   "author"
    t.string   "charge"
    t.integer  "portada_id"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "crowdblog_section_posts", :force => true do |t|
    t.integer  "home_section_id"
    t.integer  "post_id"
    t.string   "post_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "crowdblog_weather_notes", :force => true do |t|
    t.string   "title"
    t.string   "balazo"
    t.integer  "portada_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "post_id"
  end

  create_table "redactor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], :name => "idx_redactor_assetable"
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_redactor_assetable_type"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "user_dropbox_sessions", :force => true do |t|
    t.integer  "user_id"
    t.text     "dropbox_session"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "delta_cursor"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.boolean  "is_publisher"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "email",                :default => "", :null => false
    t.string   "encrypted_password",   :default => "", :null => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.string   "gravatar_alias"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "versions", :force => true do |t|
    t.integer  "versioned_id"
    t.string   "versioned_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "user_name"
    t.text     "modifications"
    t.integer  "number"
    t.integer  "reverted_from"
    t.string   "tag"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "versions", ["created_at"], :name => "index_versions_on_created_at"
  add_index "versions", ["number"], :name => "index_versions_on_number"
  add_index "versions", ["tag"], :name => "index_versions_on_tag"
  add_index "versions", ["user_id", "user_type"], :name => "index_versions_on_user_id_and_user_type"
  add_index "versions", ["user_name"], :name => "index_versions_on_user_name"
  add_index "versions", ["versioned_id", "versioned_type"], :name => "index_versions_on_versioned_id_and_versioned_type"

end
