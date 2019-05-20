class AddStoryLocationToSnippets < ActiveRecord::Migration[5.2]
  def change
    add_column :snippets, :story_location, :string
  end
end
