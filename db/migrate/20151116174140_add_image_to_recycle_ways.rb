class AddImageToRecycleWays < ActiveRecord::Migration
  def change
    add_column :recycling_ways, :image_name, :string
  end
end
