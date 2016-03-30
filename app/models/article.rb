class Article < ActiveRecord::Base

	#attr_accessor :image
	IMAGENES=File.join Rails.root , 'public','assets','images','articles'

#	def initialize(attributes={})
#		super
#		@image_url ||= "Hola"
#	end
	
	validates :title , presence:true 
	validates :content , presence:true 
	validates :extension , presence: { message:"Debe subir la imagen"}


	def image_url

		current_path = Dir.pwd
		base_path = current_path + "/public/"
		image_path = "assets/images/articles/#{id}.jpg"

		image_path if File.exist?(base_path + image_path)
	end

	after_save:guardar_imagen

	def image=(file_data)
		unless file_data.blank?
			@file_data= file_data
			self.extension= file_data.original_filename.split('.').last.downcase

		end
	end

	def image_filename
		File.join IMAGENES,"#{id}.#{extension}"
	end

	def image_path
		"/assets/images/articles/#{id}.#{extension}"
	end


	private

	def guardar_imagen
		if @file_data
			FileUtils.mkdir_p IMAGENES
			File.open(image_filename,'wb') do |f|
				f.write(@file_data.read)
		end
		@file_data=nil
	end

 	end

end
