class DropTableApiV1SearchLists < ActiveRecord::Migration[5.2]
  def change
    drop_table :api_v1_search_lists
  end
end
