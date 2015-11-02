class ChangeCoordinatesOnLineStrings < ActiveRecord::Migration
  def change
  	change_column :line_strings, :coordinates, :text, :null => false
  end
end
