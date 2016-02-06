class AddColumnToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :column, :integer
  end
end
