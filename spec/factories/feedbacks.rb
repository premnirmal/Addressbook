# spec/factories/feedbacks.rb

require 'faker'

FactoryGirl.define do
  factory :feedback do |f|
    f.name { Faker::Name.first_name }
    f.comment {"This is my comment"}
  end
end
