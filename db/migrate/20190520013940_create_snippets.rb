class CreateSnippets < ActiveRecord::Migration[5.2]
  def change
    create_table :snippets do |t|
      t.text :text
      t.boolean :system_specific

      t.timestamps
    end
  end
end
