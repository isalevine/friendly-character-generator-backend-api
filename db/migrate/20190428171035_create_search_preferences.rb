class CreateSearchPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :search_preferences do |t|
      t.integer :base_character_id
      t.string :stat_preference
      t.string :action_preference
      t.string :power_preference

      t.timestamps
    end
  end
end
