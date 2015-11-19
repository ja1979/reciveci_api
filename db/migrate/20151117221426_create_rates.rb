class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :title
      t.text :description
      t.string :image_name

      t.timestamps
    end
  end
end
