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

ActiveRecord::Schema.define(version: 20180103150815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: :cascade do |t|
    t.boolean "status"
    t.string "title", null: false
    t.text "description", null: false
    t.string "employment_type", null: false
    t.string "country"
    t.string "city"
    t.boolean "remote"
    t.string "currency"
    t.integer "salary_from"
    t.integer "salary_to"
    t.boolean "salary_by_agreement"
    t.text "tasks", null: false
    t.text "requirements", null: false
    t.text "condition", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "email", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roles", default: [], array: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
