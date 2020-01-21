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

ActiveRecord::Schema.define(version: 2019_10_03_125648) do

  create_table "crew_members", force: :cascade do |t|
    t.string "birthday"
    t.integer "gender_id"
    t.string "place_of_birth"
    t.string "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "crew_member_type"
    t.string "image"
  end

  create_table "director_movies", force: :cascade do |t|
    t.integer "director_id"
    t.integer "movie_id"
  end

  create_table "directors", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "nationality"
    t.string "username"
    t.string "password_digest"
    t.string "image"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friends", force: :cascade do |t|
    t.integer "friender_id"
    t.integer "friendee_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "abbreviation"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.string "synopsis"
    t.integer "release_year"
    t.string "production_company"
    t.integer "language_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "budget"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.integer "movie_id"
    t.integer "director_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_crew_members", force: :cascade do |t|
    t.string "crew_member_id"
    t.string "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "director_id"
    t.string "job"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "movie_id"
    t.date "start_date"
    t.date "end_date"
    t.integer "budget"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.string "name"
    t.string "description"
    t.integer "amount_spent"
  end

  create_table "roles", force: :cascade do |t|
    t.integer "crew_member_id"
    t.integer "movie_id"
    t.integer "wage"
    t.date "hire_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.boolean "featured"
  end

end
