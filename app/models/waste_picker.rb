class WastePicker < ActiveRecord::Base


	has_many :routes

	def image_url

		current_path = Dir.pwd		
		base_path = current_path + "/public/"
		image_path = "assets/images/waste_pickers/#{id}.jpg"

		image_path if File.exist?(base_path + image_path)
	end

end
