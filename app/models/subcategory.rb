class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :recyclingWays

  def image_url

    image_base_path = "assets/images/subcategories/"

    current_path = Dir.pwd
    base_path = current_path + "/public/"
    image_path = image_base_path + "#{image_name}"

    if File.exist?(base_path + image_path) then
      image_path
    else
      image_base_path + "404.jpg"
    end
  end

end
