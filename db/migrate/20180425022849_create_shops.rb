class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.text :name
      t.text :open
      t.text :midnight
      t.text :middle_area_name
      t.text :middle_area_code
      t.text :small_area_name
      t.text :small_area_code
      t.text :genre
      t.text :food_name
      t.text :price
      t.float :rep_price
      t.text :open_hour
      t.integer :start
      t.integer :end
      t.float :o16
      t.float :o17
      t.float :o18
      t.float :o19
      t.float :o20
      t.float :o21
      t.float :o22
      t.float :o23
      t.float :o24
      t.float :o25
      t.float :o26
      t.float :o27
      t.float :o28
      t.float :o29
      t.integer :area_id
      t.integer :small_area_id
    end
  end
end
