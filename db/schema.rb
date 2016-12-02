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

ActiveRecord::Schema.define(version: 20161202154952) do

  create_table "attendees", force: :cascade do |t|
    t.float    "fee"
    t.string   "shirt_size"
    t.boolean  "paid",            default: false
    t.integer  "event_id"
    t.integer  "organization_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["event_id"], name: "index_attendees_on_event_id"
    t.index ["organization_id"], name: "index_attendees_on_organization_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_comments_on_event_id"
  end

  create_table "contributions", force: :cascade do |t|
    t.float    "amount"
    t.boolean  "in_honor",          default: false
    t.string   "honoree"
    t.string   "contribution_type"
    t.string   "contributor"
    t.boolean  "paid",              default: true
    t.integer  "event_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["event_id"], name: "index_contributions_on_event_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string   "promo_code"
    t.string   "description"
    t.float    "discount"
    t.date     "start_date"
    t.date     "expiration"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["event_id"], name: "index_coupons_on_event_id"
  end

  create_table "event_sizes", force: :cascade do |t|
    t.integer "size_id"
    t.integer "event_id"
    t.index ["event_id"], name: "index_event_sizes_on_event_id"
    t.index ["size_id"], name: "index_event_sizes_on_size_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "venue_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "desc"
    t.text     "teaser"
    t.float    "goal"
    t.float    "raised"
    t.date     "date"
    t.date     "registration_start"
    t.time     "start_time"
    t.boolean  "has_donation",       default: false
    t.boolean  "is_private",         default: true
    t.boolean  "has_shirt",          default: true
    t.integer  "organization_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "event_cover"
    t.index ["organization_id"], name: "index_events_on_organization_id"
  end

  create_table "guests", force: :cascade do |t|
    t.float    "fee"
    t.string   "name"
    t.string   "shirt_size"
    t.boolean  "paid"
    t.integer  "attendee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["attendee_id"], name: "index_guests_on_attendee_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "org_cover"
  end

  create_table "registration_fees", force: :cascade do |t|
    t.string   "name"
    t.float    "amount"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_registration_fees_on_event_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.text "label"
  end

end
