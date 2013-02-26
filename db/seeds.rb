# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


AddressType.delete_all
AddressType.create!(:name => 'Home', :id => 1)
AddressType.create!(:name => 'Work', :id => 2)
AddressType.create!(:name => 'Other', :id => 3)