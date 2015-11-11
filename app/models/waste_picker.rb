class WastePicker < ActiveRecord::Base

	belongs_to :affiliation

	has_many :routes

	def image_url

		image_base_path = "assets/images/waste_pickers/"


		current_path = Dir.pwd		
		base_path = current_path + "/public/"
		image_path = image_base_path + "#{id}.jpg"

		if File.exist?(base_path + image_path) then
			image_path
		else
			image_base_path + "0.jpg"
		end
	end

end
