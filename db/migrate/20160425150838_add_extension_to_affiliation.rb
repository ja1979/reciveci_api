class AddExtensionToAffiliation < ActiveRecord::Migration
  def change
    add_column :affiliations, :extension, :string
  end
end
