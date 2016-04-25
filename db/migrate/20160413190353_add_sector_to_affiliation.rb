class AddSectorToAffiliation < ActiveRecord::Migration
  def change
    add_column :affiliations, :sector, :string
  end
end
