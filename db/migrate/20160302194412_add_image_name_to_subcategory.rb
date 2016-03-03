class AddImageNameToSubcategory < ActiveRecord::Migration
  def change
    add_column :subcategories, :image_name, :string
  end
end
