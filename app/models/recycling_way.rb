class RecyclingWay < ActiveRecord::Base
  
  belongs_to :subcategory
  #has_many :recyclingWayImages
  
  def image_url


    return nil unless image_name


    image_base_path = "assets/images/ways/"

    current_path = Dir.pwd    
    base_path = current_path + "/public/"
    image_path = image_base_path + "#{image_name}"

    if File.exist?(base_path + image_path) then
      image_path
    end
  end
  
end
