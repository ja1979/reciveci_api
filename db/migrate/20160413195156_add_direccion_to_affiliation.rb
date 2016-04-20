class AddDireccionToAffiliation < ActiveRecord::Migration
  def change
    add_column :affiliations, :direccion, :string
  end
end
