class RemoveColumnBaseCharacterIdFromSearchPreferences < ActiveRecord::Migration[5.2]
  def change
    remove_column :search_preferences, :base_character_id
  end
end
