# spec/factories/emails.rb
require 'faker'

r = Random

FactoryGirl.define do
  factory :email do |e|
    e.address_type_id {r.rand(1..4)}
    e.name {Faker::Internet.email}
  end
end
