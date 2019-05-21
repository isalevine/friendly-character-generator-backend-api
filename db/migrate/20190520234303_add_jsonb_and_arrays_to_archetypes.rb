class AddJsonbAndArraysToArchetypes < ActiveRecord::Migration[5.2]
  def change
    add_column :archetypes, :stat_priorities, :jsonb, null: false, default: '{}'
    add_column :archetypes, :skill_priorities, :jsonb, null: false, default: '{}'
    add_column :archetypes, :power_priorities, :jsonb, null: false, default: '{}'
    add_column :archetypes, :system_unique, :jsonb, null: false, default: '{}'
  end
end
