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

ActiveRecord::Schema.define(version: 20160325220900) do

  create_table "buses", force: :cascade do |t|
    t.string   "number",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "circle_check_scores", force: :cascade do |t|
    t.integer  "total_defects",  limit: 4
    t.integer  "defects_found",  limit: 4
    t.integer  "participant_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "distance_targets", force: :cascade do |t|
    t.integer  "x",           limit: 4
    t.integer  "y",           limit: 4
    t.integer  "direction",   limit: 4
    t.integer  "intervals",   limit: 4
    t.integer  "multiplier",  limit: 4
    t.integer  "maneuver_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "name",        limit: 255
    t.integer  "minimum",     limit: 4
  end

  create_table "maneuver_participants", force: :cascade do |t|
    t.integer  "maneuver_id",           limit: 4
    t.integer  "participant_id",        limit: 4
    t.string   "obstacles_hit",         limit: 255
    t.boolean  "completed_as_designed"
    t.integer  "reversed_direction",    limit: 4
    t.integer  "score",                 limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "speed_achieved"
    t.string   "distances_achieved",    limit: 255
    t.boolean  "made_additional_stops"
  end

  create_table "maneuvers", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "sequence_number",         limit: 4
    t.integer  "speed_target",            limit: 4
    t.boolean  "counts_additional_stops"
  end

  create_table "obstacles", force: :cascade do |t|
    t.integer  "x",             limit: 4
    t.integer  "y",             limit: 4
    t.integer  "point_value",   limit: 4
    t.integer  "maneuver_id",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "obstacle_type", limit: 255
  end

  create_table "participants", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "number",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "bus_id",     limit: 4
  end

  create_table "quiz_scores", force: :cascade do |t|
    t.float    "points_achieved", limit: 24
    t.float    "total_points",    limit: 24
    t.integer  "participant_id",  limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
