class AddAffiliationToWastePickers < ActiveRecord::Migration
  def change
    add_reference :waste_pickers, :affiliation, index: true
  end
end
