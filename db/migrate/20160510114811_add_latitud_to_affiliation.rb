class AddLatitudToAffiliation < ActiveRecord::Migration
  def change
    add_column :affiliations, :latitude, :float
  end
end
