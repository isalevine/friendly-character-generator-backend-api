class AddImgUrlToArchetypes < ActiveRecord::Migration[5.2]
  def change
    add_column :archetypes, :img_url, :string
  end
end
