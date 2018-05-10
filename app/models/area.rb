class Area < ActiveRecord::Base
  has_many :small_areas
  has_many :shops
end
