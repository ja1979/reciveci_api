class AddPhone1ToAffiliation < ActiveRecord::Migration
  def change
    add_column :affiliations, :phone1, :string
  end
end
