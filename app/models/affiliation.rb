class Affiliation < ActiveRecord::Base

	has_many :waste_pickers

	validates :name, presence:{message:"Debe ingresar el nombre de la Asociacion"},length:{
minimum:6,
too_short:"%{count} es el minimo de caracteres"
	}

end
