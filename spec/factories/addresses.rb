# spec/factories/addresses.rb

require 'faker'

r = Random

FactoryGirl.define do
  factory :address do |a|
    a.street { Faker::Address.street_name }
    a.city { Faker::Address.city }
    a.address_type_id {r.rand(1..4)}
    a.state {Faker::Address.state_abbr}
    a.zip {Faker::Address.zip_code}
  end
end
