class AlterCategoriesDescriptionSize < ActiveRecord::Migration
  def up
    change_column :categories, :description, :text
    change_column :subcategories, :description, :text
    change_column :recycling_ways, :description, :text
  end
end
