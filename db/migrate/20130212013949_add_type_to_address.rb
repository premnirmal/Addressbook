class AddTypeToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :address_type_id, :integer
  end
end
