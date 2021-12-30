# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_30_180400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carbons", force: :cascade do |t|
    t.bigint "sample_id", null: false
    t.float "concentration"
    t.float "ph"
    t.float "temperature"
    t.float "salinity"
    t.float "pressure"
    t.string "method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sample_id"], name: "index_carbons_on_sample_id"
  end

  create_table "cnratios", force: :cascade do |t|
    t.bigint "sediment_id", null: false
    t.float "c_total"
    t.float "calcidif"
    t.float "n_total"
    t.float "delta_13c"
    t.float "delta_15n"
    t.string "method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sediment_id"], name: "index_cnratios_on_sediment_id"
  end

  create_table "methanes", force: :cascade do |t|
    t.bigint "sample_id", null: false
    t.float "concentration"
    t.string "method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sample_id"], name: "index_methanes_on_sample_id"
  end

  create_table "psediments", force: :cascade do |t|
    t.bigint "sediment_id", null: false
    t.float "p_total"
    t.float "cinorg"
    t.float "delta_13c"
    t.string "method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sediment_id"], name: "index_psediments_on_sediment_id"
  end

  create_table "researchers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "institution"
    t.string "city"
    t.string "country"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "samples", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "researcher_id", null: false
    t.string "type"
    t.float "latitude"
    t.float "longitude"
    t.string "date_sample"
    t.string "date_analysis"
    t.string "equipment"
    t.string "local_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["researcher_id"], name: "index_samples_on_researcher_id"
    t.index ["user_id"], name: "index_samples_on_user_id"
  end

  create_table "sediments", force: :cascade do |t|
    t.bigint "sample_id", null: false
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sample_id"], name: "index_sediments_on_sample_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "carbons", "samples"
  add_foreign_key "cnratios", "sediments"
  add_foreign_key "methanes", "samples"
  add_foreign_key "psediments", "sediments"
  add_foreign_key "samples", "researchers"
  add_foreign_key "samples", "users"
  add_foreign_key "sediments", "samples"
end