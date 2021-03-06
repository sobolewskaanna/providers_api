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

ActiveRecord::Schema.define(version: 2018_06_04_012123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "providers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "provider_id", null: false
    t.string "name", null: false
    t.string "street_address", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.integer "zip_code", null: false
    t.string "hospital_referral_region_description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "summaries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "drg_definition", null: false
    t.integer "total_discharges", default: 0, null: false
    t.integer "average_covered_charges", default: 0, null: false
    t.integer "average_total_payments", default: 0, null: false
    t.integer "average_medicare_payments", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "provider_id"
    t.index ["provider_id"], name: "index_summaries_on_provider_id"
  end

  add_foreign_key "summaries", "providers"
end
