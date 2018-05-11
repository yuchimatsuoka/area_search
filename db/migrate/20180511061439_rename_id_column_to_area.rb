class RenameIdColumnToArea < ActiveRecord::Migration
  def change
    rename_column :areas, :id, :area_id
  end
end
