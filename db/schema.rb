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

ActiveRecord::Schema.define(version: 2019_05_20_234303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "archetypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "stat_priorities", default: "{}", null: false
    t.jsonb "skill_priorities", default: "{}", null: false
    t.jsonb "power_priorities", default: "{}", null: false
    t.jsonb "system_unique", default: "{}", null: false
  end

  create_table "base_characters", force: :cascade do |t|
    t.string "name"
    t.integer "archetype_id"
    t.integer "search_preference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_systems", force: :cascade do |t|
    t.string "full_title"
    t.string "edition"
    t.string "alias"
    t.string "unique_name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "system_classes", default: "{}", null: false
    t.jsonb "system_races", default: "{}", null: false
    t.jsonb "system_stats", default: "{}", null: false
    t.jsonb "system_skills", default: "{}", null: false
    t.jsonb "system_powers", default: "{}", null: false
    t.jsonb "system_spells", default: "{}", null: false
    t.text "system_unique", default: [], array: true
    t.text "unique_snippet_sources", default: [], array: true
    t.jsonb "stat_conversions", default: "{}", null: false
    t.jsonb "skill_conversions", default: "{}", null: false
    t.jsonb "class_conversions", default: "{}", null: false
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
    t.string "story_location"
  end

  create_table "tags", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
