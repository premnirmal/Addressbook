# spec/factories/phonenumbers.rb
require 'faker'

r = Random

FactoryGirl.define do
  factory :phonenumber do |p|
    p.address_type_id {r.rand(1..4)}
    p.name {Faker::PhoneNumber.cell_phone}
  end
end
