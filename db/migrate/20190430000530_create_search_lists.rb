class CreateSearchLists < ActiveRecord::Migration[5.2]
  def change
    create_table :search_lists do |t|
      t.integer :archetype_id
      t.string :search_playstyle_pref
      t.string :search_action_pref
      t.string :search_stat_pref
      t.string :search_power_pref

      t.timestamps
    end
  end
end

# may be worth deprecating "search_stat_preference", and just
# rely on playstyle and action to guide the searching?
