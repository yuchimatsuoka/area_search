class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :text
      t.integer :small_area_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
