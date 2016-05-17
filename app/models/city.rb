class City < ActiveRecord::Base

has_many :affiliations

validates :name , presence:{ message:"Debe ingresar el nombre de la ciudad"}
end
