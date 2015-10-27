class Article < ActiveRecord::Base

#	attr_accessor :image_url

#	def initialize(attributes={})
#		super
#		@image_url ||= "Hola"
#	end

	def image_url

		puts "***********************"
		puts ENV["OPENSHIFT_HOMEDIR"]
		puts ENV["OPENSHIFT_REPO_DIR"]

		base_path = "/home/vagrant/Projects/reciveci/reciveci_api/public/"
		image_path = "assets/images/articles/#{id}.jpg"

		image_path if File.exist?(base_path + image_path)
	end




end
