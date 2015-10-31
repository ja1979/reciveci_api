class AddColorToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :color, :string
  end
end
