class RenameIdColumnToSmallArea < ActiveRecord::Migration
  def change
    rename_column :small_areas, :id, :small_id
  end
end
