class AddLongitudToAffiliation < ActiveRecord::Migration
  def change
    add_column :affiliations, :longitud, :float
  end
end
