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

ActiveRecord::Schema.define(version: 2022_09_01_194425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gases", force: :cascade do |t|
    t.bigint "sample_id", null: false
    t.string "gas_type"
    t.string "chamber_type"
    t.float "gase_co2"
    t.float "gase_ch4"
    t.float "gase_n2o"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sample_id"], name: "index_gases_on_sample_id"
  end

  create_table "researchers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "institution"
    t.string "city"
    t.string "nation"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "samples", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "researcher_id", null: false
    t.string "type"
    t.float "latitude"
    t.float "longitude"
    t.date "date_sample"
    t.date "date_analysis"
    t.date "entry_date"
    t.date "exit_date"
    t.string "location"
    t.string "history"
    t.string "cod_sample"
    t.string "observation"
    t.string "class_sample"
    t.string "remineralization"
    t.string "ecosystem"
    t.float "sediment_co2"
    t.float "sediment_ch4"
    t.float "sediment_n2o"
    t.float "carbon"
    t.float "nitrogen"
    t.float "sand"
    t.float "silt"
    t.float "clay"
    t.float "delta_13c"
    t.float "delta_15n"
    t.float "density"
    t.string "water_type"
    t.float "water_co2"
    t.float "water_ch4"
    t.float "water_n2o"
    t.string "gas_type"
    t.string "chamber_type"
    t.float "gase_co2"
    t.float "gase_ch4"
    t.float "gase_n2o"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["researcher_id"], name: "index_samples_on_researcher_id"
    t.index ["user_id"], name: "index_samples_on_user_id"
  end

  create_table "sediments", force: :cascade do |t|
    t.bigint "sample_id", null: false
    t.string "remineralization"
    t.string "ecosystem"
    t.float "sediment_co2"
    t.float "sediment_ch4"
    t.float "sediment_n2o"
    t.float "carbon"
    t.float "nitrogen"
    t.float "sand"
    t.float "silt"
    t.float "clay"
    t.float "delta_13c"
    t.float "delta_15n"
    t.float "density"
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

  create_table "waters", force: :cascade do |t|
    t.bigint "sample_id", null: false
    t.string "water_type"
    t.float "water_co2"
    t.float "water_ch4"
    t.float "water_n2o"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sample_id"], name: "index_waters_on_sample_id"
  end

  add_foreign_key "gases", "samples"
  add_foreign_key "samples", "researchers"
  add_foreign_key "samples", "users"
  add_foreign_key "sediments", "samples"
  add_foreign_key "waters", "samples"
end
