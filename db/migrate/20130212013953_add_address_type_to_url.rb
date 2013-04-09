class AddAddressTypeToUrl < ActiveRecord::Migration
  def change
    add_column :urls, :address_type_id, :integer
  end
end
