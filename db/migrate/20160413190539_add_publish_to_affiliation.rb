class AddPublishToAffiliation < ActiveRecord::Migration
  def change
    add_column :affiliations, :publish, :string
  end
end
