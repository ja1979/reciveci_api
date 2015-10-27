class Article < ActiveRecord::Base

#	attr_accessor :image_url

#	def initialize(attributes={})
#		super
#		@image_url ||= "Hola"
#	end

	def image_url

		current_path = Dir.pwd		
		base_path = current_path + "/public/"
		image_path = "assets/images/articles/#{id}.jpg"

		image_path if File.exist?(base_path + image_path)
	end




end
