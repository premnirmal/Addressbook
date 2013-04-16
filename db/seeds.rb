# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

require 'faker'

AddressType.delete_all
Entry.delete_all

i = 1
['Home','Work','Other'].each do |t|
  a = AddressType.new(:name => t)
  a.id = i
  i+=1
  a.save
end


r = Random
100.times do
  e = Entry.create!(
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name,
    :title => Faker::Name.title
    )
  r.rand(1...3).times do
    a = e.addresses.create!(
      :street => Faker::Address.street_name,
      :zip => Faker::Address.zip_code,
      :city => Faker::Address.city,
      :address_type_id => r.rand(1...4),
      :state => Faker::Address.state_abbr)
  end
  r.rand(1..3).times do
    m = e.emails.create!(
      :name => Faker::Internet.email,
      :address_type_id => r.rand(1...4))
  end
  r.rand(1..3).times do
    w = e.weburls.create!(
      :name => Faker::Internet.url,
      :address_type_id => r.rand(1...4))
  end
  r.rand(1..3).times do
    p = e.phonenumbers.create!(
      :name => Faker::PhoneNumber.cell_phone,
      :address_type_id => r.rand(1...4))
  end
end
