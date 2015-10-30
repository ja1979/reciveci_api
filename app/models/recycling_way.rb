class RecyclingWay < ActiveRecord::Base
  belongs_to :subcategory
  has_many :recyclingWayImages
end
