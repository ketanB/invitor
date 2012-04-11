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

ActiveRecord::Schema.define(:version => 20110330101951) do

  create_table "attribute_translations", :force => true do |t|
    t.integer  "attribute_id"
    t.string   "locale"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attribute_translations", ["attribute_id"], :name => "index_attribute_translations_on_attribute_id"

  create_table "attributes", :force => true do |t|
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bg_uploads", :force => true do |t|
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "business_categories", :force => true do |t|
    t.integer  "business_group_id"
    t.boolean  "active",            :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "business_category_translations", :force => true do |t|
    t.integer  "business_category_id"
    t.string   "locale"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "business_category_translations", ["business_category_id"], :name => "index_688a84a23cc11574a37d4fc4ee871bcd90361cc8"

  create_table "business_group_translations", :force => true do |t|
    t.integer  "business_group_id"
    t.string   "locale"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "business_group_translations", ["business_group_id"], :name => "index_50d0f11455efa92e80e125f6b17982c8496bfa3e"

  create_table "business_groups", :force => true do |t|
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id", :default => 226
  end

  create_table "categories_countries", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "country_id"
  end

  create_table "categories_themes", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "theme_id"
  end

  create_table "category_translations", :force => true do |t|
    t.integer  "category_id"
    t.string   "locale"
    t.string   "description"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_translations", ["category_id"], :name => "index_category_translations_on_category_id"

  create_table "cities", :force => true do |t|
    t.integer  "country_id"
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
  end

  create_table "city_translations", :force => true do |t|
    t.integer  "city_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "city_translations", ["city_id", "locale"], :name => "index_city_translations_on_city_id_and_locale"
  add_index "city_translations", ["city_id"], :name => "index_city_translations_on_city_id"
  add_index "city_translations", ["name", "city_id", "locale"], :name => "index_city_translations_on_name_and_city_id_and_locale"

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "guest_id"
    t.integer  "parent_id"
  end

  create_table "companies", :force => true do |t|
    t.string   "phone"
    t.string   "fax"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "zip"
    t.integer  "country_id"
    t.string   "website"
    t.string   "email"
    t.integer  "business_group_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "map_info"
    t.string   "hours"
    t.float    "rating",            :default => 0.0
    t.integer  "reviews_count",     :default => 0
    t.text     "key_words"
    t.boolean  "delta",             :default => true, :null => false
  end

  add_index "companies", ["city_id", "rating", "reviews_count"], :name => "index_companies_on_city_id_and_rating_and_reviews_count"
  add_index "companies", ["zip", "city_id", "state_id"], :name => "index_companies_on_zip_and_city_id_and_state_id"

  create_table "companies_categories", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "business_category_id"
  end

  create_table "companies_user_infos", :force => true do |t|
    t.string   "name"
    t.string   "street1"
    t.string   "street2"
    t.string   "phone"
    t.string   "fax"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "zip"
    t.integer  "country_id"
    t.string   "website"
    t.string   "email"
    t.text     "detail"
    t.boolean  "is_closed"
    t.boolean  "is_owner"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_assets", :force => true do |t|
    t.integer  "company_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_attribute_translations", :force => true do |t|
    t.integer  "company_attribute_id"
    t.string   "locale"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_attribute_translations", ["company_attribute_id"], :name => "index_fef33a337ac333e3a03cf39d4fee3a9d1778be69"

  create_table "company_attributes", :force => true do |t|
    t.integer  "company_id"
    t.integer  "attribute_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_contacts", :force => true do |t|
    t.integer "compay_id"
    t.integer "user_id"
  end

  create_table "company_solicitudes", :force => true do |t|
    t.integer  "solicitude_id"
    t.integer  "company_id"
    t.boolean  "is_new"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_translations", :force => true do |t|
    t.integer  "company_id"
    t.string   "locale"
    t.string   "state_str"
    t.string   "street2"
    t.string   "name"
    t.string   "city_str"
    t.string   "street1"
    t.text     "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_translations", ["company_id"], :name => "index_company_translations_on_company_id"
  add_index "company_translations", ["name", "company_id", "locale"], :name => "index_company_translations_on_name_and_company_id_and_locale"
  add_index "company_translations", ["name"], :name => "index_company_translations_on_name"

  create_table "contact_group_translations", :force => true do |t|
    t.integer  "contact_group_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contact_group_translations", ["contact_group_id"], :name => "index_326229950910e34cf8723f40e87cfbf30633dac6"

  create_table "contact_groups", :force => true do |t|
    t.integer  "user_id"
    t.integer  "contacts_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.integer  "user_id"
    t.string   "full_name"
    t.string   "email"
    t.string   "phone"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tmp_user_id"
    t.integer  "contact_group_id"
  end

  create_table "contacts_invitations", :id => false, :force => true do |t|
    t.integer "contact_id"
    t.integer "invitation_id"
  end

  create_table "countries", :force => true do |t|
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",     :default => true
  end

  create_table "country_translations", :force => true do |t|
    t.integer  "country_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "country_translations", ["country_id"], :name => "index_country_translations_on_country_id"

  create_table "designs", :force => true do |t|
    t.integer  "event_id"
    t.string   "caption"
    t.integer  "theme_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fg_image_url"
    t.string   "bg_image_url"
  end

  create_table "event_assets", :force => true do |t|
    t.integer  "event_id"
    t.integer  "uploaded_by"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_assets", ["event_id"], :name => "index_event_assets_on_event_id"

  create_table "event_settings", :force => true do |t|
    t.integer  "event_id"
    t.boolean  "allow_pictures",                :default => true
    t.boolean  "allow_videos",                  :default => true
    t.boolean  "allow_guest_to_invite_friends", :default => true
    t.boolean  "allow_guests_to_bring_people",  :default => true
    t.integer  "max_people_to_bring"
    t.boolean  "display_guest_list",            :default => true
    t.string   "cap_attendees_at"
    t.boolean  "show_comment_board",            :default => true
    t.boolean  "show_profile_pictures",         :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "public_event",                  :default => true
    t.boolean  "allow_guest_maybe",             :default => true
    t.boolean  "max_guests",                    :default => true
    t.integer  "max_guests_num"
    t.integer  "reminder_days"
    t.boolean  "event_reminder",                :default => true
    t.boolean  "reminder_yes",                  :default => true
    t.boolean  "reminder_maybe",                :default => true
    t.boolean  "reminder_no_reply",             :default => true
  end

  create_table "event_translations", :force => true do |t|
    t.integer  "event_id"
    t.string   "locale"
    t.string   "location_address"
    t.string   "location_name"
    t.text     "description"
    t.string   "hosted_by"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_translations", ["event_id"], :name => "index_event_translations_on_event_id"

  create_table "events", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "time_zone"
    t.date     "date"
    t.time     "time"
    t.boolean  "launched",      :default => false
    t.date     "reminder_date"
  end

  create_table "fg_uploads", :force => true do |t|
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guests", :force => true do |t|
    t.integer  "event_id"
    t.integer  "contact_id"
    t.integer  "invitation_id"
    t.integer  "user_id"
    t.integer  "response",              :default => 0
    t.string   "g_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "additional_guests",     :default => 0
    t.boolean  "send_daily_activity",   :default => false
    t.boolean  "event_host",            :default => false
    t.string   "language",              :default => "en"
    t.boolean  "invited",               :default => false
    t.integer  "invited_by"
    t.boolean  "email_viewed",          :default => false
    t.datetime "email_viewed_at"
    t.datetime "invited_at"
    t.integer  "invited_by_guest_g_id"
    t.integer  "no_of_people_to_bring", :default => 0
  end

  create_table "invitations", :force => true do |t|
    t.string   "name"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "locale"
  end

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "from"
    t.integer  "to"
    t.string   "title"
    t.text     "description"
    t.integer  "parent"
    t.boolean  "is_new"
    t.integer  "csolicitude_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quote_confirms", :force => true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.string   "solicitude"
    t.integer  "amount"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quote_solicitations", :force => true do |t|
    t.integer  "quote_id"
    t.text     "solicitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quotes", :force => true do |t|
    t.string   "title"
    t.integer  "business_group_id"
    t.text     "description"
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "miles_way"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "id_event"
  end

  create_table "reviews", :force => true do |t|
    t.string   "user_id"
    t.text     "comment"
    t.integer  "rating"
    t.integer  "status"
    t.integer  "reviewable_id"
    t.string   "reviewable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "state_translations", :force => true do |t|
    t.integer  "state_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "state_translations", ["name", "state_id", "locale"], :name => "index_state_translations_on_name_and_state_id_and_locale"
  add_index "state_translations", ["state_id", "locale"], :name => "index_state_translations_on_state_id_and_locale"
  add_index "state_translations", ["state_id"], :name => "index_state_translations_on_state_id"

  create_table "states", :force => true do |t|
    t.integer  "country_id"
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type"], :name => "index_taggings_on_ttt", :unique => true
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"
  add_index "taggings", ["taggable_id"], :name => "index_taggings_on_taggable_id"

  create_table "tags", :force => true do |t|
    t.string "name"
    t.string "locale", :default => "en"
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "theme_translations", :force => true do |t|
    t.integer  "theme_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "theme_translations", ["theme_id"], :name => "index_theme_translations_on_theme_id"

  create_table "themes", :force => true do |t|
    t.string   "name"
    t.boolean  "default"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bg_image_file_name"
    t.string   "bg_image_content_type"
    t.integer  "bg_image_file_size"
    t.datetime "bg_image_updated_at"
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
  end

  create_table "user_companies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_translations", :force => true do |t|
    t.integer  "user_id"
    t.string   "locale"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_translations", ["user_id"], :name => "index_user_translations_on_user_id"

  create_table "users", :force => true do |t|
    t.integer  "role_id"
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "cached_slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "facebook_uid"
    t.string   "email_hash"
  end

  create_table "videos", :force => true do |t|
    t.integer  "event_id"
    t.string   "embed_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
