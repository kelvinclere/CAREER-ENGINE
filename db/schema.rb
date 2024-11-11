# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_11_11_115105) do
  create_table "careers", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "liked_careers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "career_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["career_id"], name: "index_liked_careers_on_career_id"
    t.index ["user_id"], name: "index_liked_careers_on_user_id"
  end

  create_table "liked_schools", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "career_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "school_id"
    t.index ["career_id"], name: "index_liked_schools_on_career_id"
    t.index ["user_id"], name: "index_liked_schools_on_user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_careers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "career_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["career_id"], name: "index_user_careers_on_career_id"
    t.index ["user_id"], name: "index_user_careers_on_user_id"
  end

  create_table "user_schools", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "career_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["career_id"], name: "index_user_schools_on_career_id"
    t.index ["user_id"], name: "index_user_schools_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "liked_careers", "careers"
  add_foreign_key "liked_careers", "users"
  add_foreign_key "liked_schools", "careers"
  add_foreign_key "liked_schools", "users"
  add_foreign_key "user_careers", "careers"
  add_foreign_key "user_careers", "users"
  add_foreign_key "user_schools", "careers"
  add_foreign_key "user_schools", "users"
end
