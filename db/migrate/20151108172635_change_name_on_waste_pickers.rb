class ChangeNameOnWastePickers < ActiveRecord::Migration
  def change
  	change_column_null :waste_pickers, :name, false
  end
end
