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

ActiveRecord::Schema.define(version: 2021_08_05_185431) do

  create_table "match_rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string "status"
  end

  create_table "moves", force: :cascade do |t|
    t.integer "match_room_id", null: false
    t.integer "player_id", null: false
    t.string "notation"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_room_id"], name: "index_moves_on_match_room_id"
    t.index ["player_id"], name: "index_moves_on_player_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.integer "player_id", null: false
    t.string "coordinates"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "family"
    t.index ["player_id"], name: "index_pieces_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer "match_room_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "color"
    t.index ["match_room_id"], name: "index_players_on_match_room_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "moves", "match_rooms"
  add_foreign_key "moves", "players"
  add_foreign_key "pieces", "players"
  add_foreign_key "players", "match_rooms"
  add_foreign_key "players", "users"
end
