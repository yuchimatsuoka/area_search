class SmallArea < ActiveRecord::Base
  belongs_to :area
  has_many :posts
  has_many :shops
end
