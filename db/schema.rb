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

ActiveRecord::Schema.define(version: 2018_12_20_130637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enrichments", force: :cascade do |t|
    t.string "recipient_id"
    t.string "product_id"
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "user_id"
    t.string "logo_url"
    t.string "name"
    t.string "site_url"
    t.string "public_contact_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipients", force: :cascade do |t|
    t.integer "product_id"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.jsonb "custom_data"
    t.datetime "sent_survey_at"
    t.datetime "completed_survey_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "survey_token"
  end

  create_table "survey_responses", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "product_id"
    t.integer "disappointment"
    t.text "ideal_customer"
    t.text "main_benefits"
    t.text "recommended_improvements"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "indexed", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "word_clouds", force: :cascade do |t|
    t.integer "product_id"
    t.jsonb "words", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
