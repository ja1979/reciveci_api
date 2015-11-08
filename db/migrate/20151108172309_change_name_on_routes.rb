class ChangeNameOnRoutes < ActiveRecord::Migration
  def change
    change_column_null :routes, :name, false
    change_column_null :routes, :schedule, false
    change_column_null :routes, :color, false
  end
end
