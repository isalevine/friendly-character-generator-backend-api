class CreateBaseCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :base_characters do |t|
      t.string :name
      t.integer :archetype_id
      t.integer :search_preference_id

      t.timestamps
    end
  end
end
