class CreateRecyclingWays < ActiveRecord::Migration
  def change
    create_table :recycling_ways do |t|
      t.string :title
      t.string :description
      t.references :subcategory, index: true

      t.timestamps
    end
  end
end
