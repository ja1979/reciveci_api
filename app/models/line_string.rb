class LineString < ActiveRecord::Base

	belongs_to :route

	validates :name, :presence => true
	validates :coordinates, :presence => true

end
