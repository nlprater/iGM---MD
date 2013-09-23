# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20130914132828) do

  create_table "draft_positions", force: true do |t|
    t.integer  "team_id"
    t.integer  "round_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drafts", force: true do |t|
    t.string   "name"
    t.integer  "creator_id"
    t.integer  "number_of_gms"
    t.integer  "number_of_rounds"
    t.string   "access"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gm_stints", force: true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.integer  "draft_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string  "name"
    t.string  "file"
    t.integer "user_id"
  end

  create_table "players", force: true do |t|
    t.string   "full_name"
    t.string   "position"
    t.string   "college_year"
    t.string   "college"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", force: true do |t|
    t.integer  "draft_id"
    t.integer  "draft_round_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "selections", force: true do |t|
    t.integer  "user_id"
    t.integer  "draft_id"
    t.integer  "round_id"
    t.integer  "team_id"
    t.integer  "player_id"
    t.integer  "draft_position_id"
    t.integer  "overall_position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "selections", ["draft_id"], name: "index_selections_on_draft_id"
  add_index "selections", ["draft_position_id"], name: "index_selections_on_draft_position_id"
  add_index "selections", ["overall_position"], name: "index_selections_on_overall_position"
  add_index "selections", ["player_id"], name: "index_selections_on_player_id"
  add_index "selections", ["round_id"], name: "index_selections_on_round_id"
  add_index "selections", ["team_id"], name: "index_selections_on_team_id"
  add_index "selections", ["user_id"], name: "index_selections_on_user_id"

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "division"
    t.string   "conference"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "photo_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
