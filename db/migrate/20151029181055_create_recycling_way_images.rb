class CreateRecyclingWayImages < ActiveRecord::Migration
  def change
    create_table :recycling_way_images do |t|
      t.string :title
      t.string :url
      t.references :recyclingWay, index: true

      t.timestamps
    end
  end
end
