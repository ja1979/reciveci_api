class AddExamplesToSubcategory < ActiveRecord::Migration
  def change
    add_column :subcategories, :examples, :text
  end
end
