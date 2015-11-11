class Affiliation < ActiveRecord::Base

	has_many :waste_pickers

	validates :name, :presence => true	

end
