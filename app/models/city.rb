class City < ActiveRecord::Base
validates :name , presence:{ message:"Debe ingresar el nombre de la ciudad"}
end
