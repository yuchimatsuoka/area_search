class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.text :middle_area_code
      t.integer :count
      t.float :price_mean
      t.text :small_area_name
    end
  end
end
