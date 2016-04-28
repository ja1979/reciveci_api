class Affiliation < ActiveRecord::Base

	has_many :waste_pickers

	validates :name, presence:{message:"Debe ingresar el nombre de la Asociacion"},length:{
minimum:6,
too_short:"%{count} es el minimo de caracteres"
	}

	validates :sector , presence:{ message:"Debe ingresar el sector al que pertenece la asociacion"}
	validates :direccion , presence:{ message:"Debe ingresar la direccion de la asociacion"}
	validates :phone1 , presence:{ message:"Debe ingresar el telefono de la asociacion"}
	 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email , presence:{ message:"Debe ingresar el email de la asociacion"},format: { 
		:with => VALID_EMAIL_REGEX , message: "El formato del correo es invalido" }
	validates :extension , presence: { message:"Debe subir una imagen para la asociacion"}



	IMAGENES=File.join Rails.root , 'public','assets','images','affiliations'

	def image_url

	 	current_path = Dir.pwd
	 	base_path = current_path + "/public/"
	 	image_path = "assets/images/affiliations/#{id}.#{extension}"

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
		"/assets/images/affiliations/#{id}.#{extension}"
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
