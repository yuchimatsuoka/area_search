class CreateSmallAreas < ActiveRecord::Migration
  def change
    create_table :small_areas do |t|
      t.text :small_area_code
      t.text :small_area_name
      t.integer :area_id
      t.integer :count
      t.float :price_mean
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
      t.float :or23
      t.float :or24
      t.float :or25
      t.float :or26
      t.float :or27
      t.float :or28
      t.float :or29
      t.integer :イタリア料理
      t.integer :インド料理
      t.integer :おでん
      t.integer :かに・えび・うに・海鮮料理
      t.integer :しゃぶしゃぶ
      t.integer :ステーキ
      t.integer :スペイン料理
      t.integer :タイ料理
      t.integer :フランス料理
      t.integer :沖縄料理
      t.integer :郷土料理
      t.integer :焼き鳥・鶏料理
      t.integer :中華料理
      t.integer :炉ばた焼き・炙り焼き
    end
  end
end
