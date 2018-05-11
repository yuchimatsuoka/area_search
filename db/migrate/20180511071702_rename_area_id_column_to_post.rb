class RenameAreaIdColumnToPost < ActiveRecord::Migration
  def change
    rename_column :posts, :area_id, :small_area_id
  end
end
