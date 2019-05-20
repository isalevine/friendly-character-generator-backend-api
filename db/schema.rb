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

ActiveRecord::Schema.define(version: 2019_05_20_014053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "archetypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "base_characters", force: :cascade do |t|
    t.string "name"
    t.integer "archetype_id"
    t.integer "search_preference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "search_lists", force: :cascade do |t|
    t.integer "archetype_id"
    t.string "search_playstyle_pref"
    t.string "search_action_pref"
    t.string "search_stat_pref"
    t.string "search_power_pref"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "search_preferences", force: :cascade do |t|
    t.string "stat_preference"
    t.string "action_preference"
    t.string "power_preference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "playstyle_preference"
  end

  create_table "snippet_tags", force: :cascade do |t|
    t.integer "snippet_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snippets", force: :cascade do |t|
    t.text "text"
    t.boolean "system_specific"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
