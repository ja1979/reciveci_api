class Example < ActiveRecord::Base
	validates :name, presence:{message:"Debe ingresar un nombre"},length:{
		minimum:4,
		too_short:"%{count} es el minimo de caracteres para el nombre"

	}

  validates :subcategory_id, presence:{message:"Debe elegir una subcategoria"}
  belongs_to :subcategory

end
