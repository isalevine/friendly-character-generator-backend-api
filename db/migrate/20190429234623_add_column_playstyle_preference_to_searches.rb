class AddColumnPlaystylePreferenceToSearches < ActiveRecord::Migration[5.2]
  def change
    add_column :search_preferences, :playstyle_preference, :string
    add_column :api_v1_search_lists, :playstyle_preference, :string
  end
end
