class AddCiudadToAffiliation < ActiveRecord::Migration
  def change
    add_column :affiliations, :ciudad, :string
  end
end
