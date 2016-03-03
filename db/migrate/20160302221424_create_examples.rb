class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.string :name, null: false
      t.boolean :enabled, null: false, :default => true
      t.references :subcategory, null: false, index: true

      t.timestamps
    end
  end
end
