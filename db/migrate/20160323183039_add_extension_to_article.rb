class AddExtensionToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :extension, :string
  end
end
