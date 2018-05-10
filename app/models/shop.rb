class Shop < ActiveRecord::Base
  belongs_to :small_area
  belongs_to :middle_area
end
