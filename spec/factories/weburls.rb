# spec/factories/weburls.rb
require 'faker'

r = Random

FactoryGirl.define do
  factory :weburl do |w|
    w.address_type_id {r.rand(1..4)}
    w.name {Faker::Internet.url}
  end
end
