class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :name
      t.references :entry

      t.timestamps
    end
    add_index :urls, :entry_id
  end
end
