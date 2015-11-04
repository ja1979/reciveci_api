class AddRouteToLineStrings < ActiveRecord::Migration
  def change
    add_reference :line_strings, :route, index: true
  end
end
