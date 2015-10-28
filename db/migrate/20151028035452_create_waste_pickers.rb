class CreateWastePickers < ActiveRecord::Migration
  def change
    create_table :waste_pickers do |t|
      t.string :name
      t.date :birth_date
      t.date :start_date
      t.text :background
      t.string :message

      t.timestamps
    end
  end
end
