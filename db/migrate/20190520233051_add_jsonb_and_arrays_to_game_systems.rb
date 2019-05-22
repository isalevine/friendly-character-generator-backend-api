class AddJsonbAndArraysToGameSystems < ActiveRecord::Migration[5.2]
  def change
    add_column :game_systems, :system_classes, :jsonb, null: false, default: '{}'
    add_column :game_systems, :system_races, :jsonb, null: false, default: '{}'
    add_column :game_systems, :system_stats, :jsonb, null: false, default: '{}'
    add_column :game_systems, :system_skills, :jsonb, null: false, default: '{}'
    add_column :game_systems, :system_powers, :jsonb, null: false, default: '{}'

    add_column :game_systems, :system_spells, :jsonb, null: false, default: '{}'

    add_column :game_systems, :system_unique, :text, array:true, default: []
    add_column :game_systems, :unique_snippet_sources, :text, array:true, default: []

    add_column :game_systems, :stat_conversions, :jsonb, null: false, default: '{}'
    add_column :game_systems, :skill_conversions, :jsonb, null: false, default: '{}'
    add_column :game_systems, :class_conversions, :jsonb, null: false, default: '{}'
  end
end
