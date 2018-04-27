class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :middle_area_code
      t.string :middle_area_name
      t.string :small_area_code
      t.string :small_area_name
      t.timestamps null: false
    end
  end
end
