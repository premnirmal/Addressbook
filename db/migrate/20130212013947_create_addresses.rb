class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :street
      t.string :city
      t.string :state, :limit => 2
      t.integer :zip, :numericality => { :greater_than => 0 }
      t.integer :AddressType
      t.references :entry

      t.timestamps
    end
    add_index :addresses, :entry_id
  end
end
