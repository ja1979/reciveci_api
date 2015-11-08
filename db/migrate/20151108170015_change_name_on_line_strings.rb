class ChangeNameOnLineStrings < ActiveRecord::Migration
  def change
    change_column_null :line_strings, :name, false
    change_column_null :line_strings, :coordinates, false
  end
end
