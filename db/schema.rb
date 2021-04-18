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

ActiveRecord::Schema.define(version: 2021_04_16_154918) do

  create_table "episodes", force: :cascade do |t|
    t.integer "number"
    t.string "title"
    t.datetime "emmited_at"
    t.integer "minutes"
    t.integer "season_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "films", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "genere_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genere_id"], name: "index_films_on_genere_id"
  end

  create_table "generes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "number"
    t.datetime "begins_at"
    t.integer "film_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id"], name: "index_seasons_on_film_id"
  end

  add_foreign_key "episodes", "seasons"
  add_foreign_key "films", "generes"
  add_foreign_key "seasons", "films"
end
