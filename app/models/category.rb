class Category < ActiveRecord::Base
  has_many :subcategories


validates :name,presence:{message:"Debe ingresar nombre"},length:{
minimum:4,
too_short:"%{count} son los caracteres minimos"


}
validates :description,presence:{message:"Debe ingresar descripcion"},length:{
minimum:4,
too_short:"%{count} son los caracteres minimos"


}

validates :image_name,presence:{message:"Debe ingresar nombre de la imagen"},length:{
minimum:4,
too_short:"%{count} son los caracteres minimos"


}
validates :column,presence:{message:"Debe ingresar columna"},length:{
minimum:1,
too_short:"%{count} son los caracteres minimos"


}
validates :waste_type,presence:{message:"Debe ingresar tipo de residuo"},length:{
minimum:3,
too_short:"%{count} son los caracteres minimos"


}

  def image_url

    image_base_path = "assets/images/categories/"

    current_path = Dir.pwd
    base_path = current_path + "/public/"
    image_path = image_base_path + "#{image_name}"

    if File.exist?(base_path + image_path) then
      image_path
    else
      image_base_path + "404.jpg"
    end
  end


  # def as_json(options={})
  #   super(:only => [:name,:description,:waste_type],
  #         :include => {
  #           :subcategories => {:only => [:name]}
  #         }
  #   )
  # end

end
