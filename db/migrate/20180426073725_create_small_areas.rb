class CreateSmallAreas < ActiveRecord::Migration
  def change
    create_table :small_areas do |t|

      t.timestamps null: false
    end
  end
end
