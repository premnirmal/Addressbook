# spec/factories/entries.rb

require 'faker'

FactoryGirl.define do
  factory :entry do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.title {Faker::Name.title}
  end

  factory :invalid_entry, parent: :entry do |f|
    f.first_name ""
    f.last_name ""
  end
end
