class CreateGameSystems < ActiveRecord::Migration[5.2]
  def change
    create_table :game_systems do |t|
      t.string :full_title
      t.string :edition
      t.string :alias
      t.string :unique_name
      t.string :description

      t.timestamps
    end
  end
end
