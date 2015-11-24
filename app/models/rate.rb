class Rate < ActiveRecord::Base
  
  def image_url

    image_base_path = "assets/images/rates/"

    current_path = Dir.pwd    
    base_path = current_path + "/public/"
    image_path = image_base_path + "#{image_name}"

    if File.exist?(base_path + image_path) then
      image_path
    else
      image_base_path + "0.jpg"
    end
    
 end
    
end
