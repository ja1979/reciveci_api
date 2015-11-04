class AddWastePickerToRoutes < ActiveRecord::Migration
  def change
    add_reference :routes, :waste_picker, index: true
  end
end
