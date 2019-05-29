class AddSnippetSearchTermsToArchetype < ActiveRecord::Migration[5.2]
  def change
    add_column :archetypes, :snippet_search_terms, :text, array:true, default: []
  end
end
