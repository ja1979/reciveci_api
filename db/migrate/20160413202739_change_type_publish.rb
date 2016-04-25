class ChangeTypePublish < ActiveRecord::Migration
  def up
    change_table :affiliations do |t|
      t.change :publish, :boolean
    end
  end

  def down
    change_table :affiliations do |t|
      t.change :publish, :boolean
    end
  end
end
