class WastePicker < ActiveRecord::Base


	validates :name ,presence:{message:"Debe ingresar un nombre"},length:{
		minimum:4,
		too_short:"El minimo requerido es de %{count} caracteres para el nombre"


	}
	validates :affiliation_id ,presence:{message:"Debe Seleccionar una asociacion"}
	validates :birth_date,presence:{message:"Debe Seleccionar la fecha de nacimiento"}
	validates :start_date ,presence:{message:"Debe Seleccionar la fecha de inicio"}
	validates :background,presence:{message:"Debe llenar el campo historial"},length:{
		minimum:20,
		too_short:"El minimo requerido es de %{count} caracteres para el historial"


	}
	validates :message,presence:{message:"Debe llenar el campo mensaje"},length:{
		minimum:10,
		too_short:"El minimo requerido es de %{count} caracteres para el mensaje"


	}









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

