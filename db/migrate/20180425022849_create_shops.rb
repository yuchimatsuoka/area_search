class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.text :open
      t.string :midnight
      t.string :middle_area_name
      t.string :middle_area_code
      t.string :small_area_name
      t.string :small_area_code
      t.string :genre
      t.string :food_name
      t.string :price
      t.timestamps null: false
    end
  end
end
