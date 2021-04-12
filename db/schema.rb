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

ActiveRecord::Schema.define(version: 2021_04_06_181741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battles", force: :cascade do |t|
    t.string "has_players"
    t.integer "lp_points", default: 100
    t.integer "rp_points", default: 100
    t.integer "system_answer"
    t.integer "user_answer"
    t.datetime "was_ready_at"
    t.string "status"
    t.integer "damage"
    t.index ["has_players"], name: "index_battles_on_has_players"
  end

  create_table "battles_players", force: :cascade do |t|
    t.integer "player_id"
    t.integer "battle_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "total_battles", default: 1
    t.integer "win", default: 0
    t.integer "loss", default: 0
    t.boolean "game", default: false
    t.index ["game"], name: "index_players_on_game"
    t.index ["name"], name: "index_players_on_name"
  end

end
