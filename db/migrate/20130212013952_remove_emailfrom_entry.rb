class RemoveEmailfromEntry < ActiveRecord::Migration
  def up
  	remove_column :entries, :email
  end

  def down

  end
end
