class AddInstructionsToSubcategory < ActiveRecord::Migration
  def change
    add_column :subcategories, :instructions, :text
  end
end
