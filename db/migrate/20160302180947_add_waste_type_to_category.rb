class AddWasteTypeToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :waste_type, :string
  end
end
