class AddImageToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :image_name, :string
  end
end
