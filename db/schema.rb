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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180612063521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "status",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "message"
    t.integer  "conversation_id"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.json     "metadata"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_comments_on_conversation_id", using: :btree
    t.index ["receiver_id"], name: "index_comments_on_receiver_id", using: :btree
    t.index ["sender_id"], name: "index_comments_on_sender_id", using: :btree
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "subject"
    t.text     "body"
    t.integer  "status",     default: 0
    t.json     "metadata",   default: {}
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "conversable_id"
    t.string   "conversable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["conversable_id", "conversable_type"], name: "index_conversations_on_conversable_id_and_conversable_type", using: :btree
  end

  create_table "data_stores", force: :cascade do |t|
    t.json     "metadata"
    t.string   "registration_number"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "garages", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "registration_number"
    t.string   "marketing_tag_line"
    t.string   "warranty_info"
    t.date     "established_at"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone_number"
    t.string   "po_box_number"
    t.string   "fax_number"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "logo"
    t.string   "cover"
    t.text     "about"
    t.jsonb    "metadata",            default: {}
    t.jsonb    "urls",                default: {}
    t.string   "opening_time"
    t.string   "closing_time"
    t.string   "open_days",           default: [],              array: true
    t.string   "payment_options",     default: [],              array: true
    t.text     "vehicle_vendors",     default: [],              array: true
    t.text     "services_ids",        default: [],              array: true
    t.integer  "status",              default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["open_days"], name: "index_garages_on_open_days", using: :gin
    t.index ["payment_options"], name: "index_garages_on_payment_options", using: :gin
    t.index ["user_id"], name: "index_garages_on_user_id", using: :btree
    t.index ["vehicle_vendors"], name: "index_garages_on_vehicle_vendors", using: :gin
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "quote_request_id"
    t.integer  "status",           default: 0
    t.jsonb    "metadata"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "new_garages", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "payment_options", force: :cascade do |t|
    t.string   "name"
    t.string   "icon_class"
    t.string   "type"
    t.string   "description"
    t.jsonb    "metadata",    default: {}
    t.integer  "status",      default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "quote_request_lots", force: :cascade do |t|
    t.integer  "vehicle_owner_id"
    t.jsonb    "metadata",         default: {}
    t.integer  "status",           default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["vehicle_owner_id"], name: "index_quote_request_lots_on_vehicle_owner_id", using: :btree
  end

  create_table "quote_requests", force: :cascade do |t|
    t.integer  "garage_id"
    t.integer  "vehicle_owner_id"
    t.integer  "quote_request_lot_id"
    t.jsonb    "vehicle_info",         default: {}
    t.jsonb    "additional_services",  default: [{}]
    t.jsonb    "service_details",      default: {}
    t.jsonb    "metadata",             default: {}
    t.text     "services_ids",         default: [],                array: true
    t.string   "warranty_offer"
    t.text     "additional_info"
    t.integer  "status",               default: 0
    t.date     "proposed_start_date"
    t.date     "proposed_end_date"
    t.string   "report"
    t.float    "quoted_amount",        default: 0.0
    t.boolean  "notify_via_sms"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["garage_id"], name: "index_quote_requests_on_garage_id", using: :btree
    t.index ["quote_request_lot_id"], name: "index_quote_requests_on_quote_request_lot_id", using: :btree
    t.index ["vehicle_owner_id"], name: "index_quote_requests_on_vehicle_owner_id", using: :btree
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "star_count"
    t.integer  "job_id"
    t.integer  "user_id"
    t.jsonb    "metadata",   default: {}
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["job_id"], name: "index_ratings_on_job_id", using: :btree
    t.index ["user_id"], name: "index_ratings_on_user_id", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "garage_id"
    t.string   "description"
    t.integer  "status",      default: 0
    t.jsonb    "metadata"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["category_id"], name: "index_services_on_category_id", using: :btree
    t.index ["garage_id"], name: "index_services_on_garage_id", using: :btree
  end

  create_table "settings", force: :cascade do |t|
    t.boolean  "notify_via_sms"
    t.boolean  "notify_via_email"
    t.boolean  "agreed_to_terms_and_condition"
    t.integer  "user_id"
    t.integer  "status",                        default: 0
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["user_id"], name: "index_settings_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             default: ""
    t.string   "last_name",              default: ""
    t.string   "phone_number",           default: ""
    t.string   "fax_number"
    t.string   "po_box_number"
    t.string   "address",                default: ""
    t.string   "city",                   default: ""
    t.string   "state",                  default: ""
    t.string   "zip",                    default: ""
    t.float    "latitude"
    t.float    "longitude"
    t.date     "date_of_birth"
    t.jsonb    "metadata",               default: {}
    t.string   "type"
    t.datetime "deleted_at"
    t.integer  "status",                 default: 0
    t.integer  "gender"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "avatar"
    t.string   "unique_key"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["deleted_at"], name: "index_users_on_deleted_at", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unique_key"], name: "index_users_on_unique_key", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  create_table "vehicle_vendors", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "description"
    t.jsonb    "metadata"
    t.integer  "status",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "fuelType"
    t.string   "make"
    t.string   "model"
    t.string   "range"
    t.string   "rangeCity"
    t.string   "year"
    t.string   "VClass"
    t.string   "cylinders"
    t.string   "displ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "garages", "users"
  add_foreign_key "ratings", "jobs"
  add_foreign_key "ratings", "users"
  add_foreign_key "services", "categories"
  add_foreign_key "services", "garages"
  add_foreign_key "settings", "users"
end
