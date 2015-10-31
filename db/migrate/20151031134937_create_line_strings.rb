class CreateLineStrings < ActiveRecord::Migration
  def change
    create_table :line_strings do |t|
      t.string :name
      t.string :coordinates

      t.timestamps
    end
  end
end
