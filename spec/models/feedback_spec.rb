# spec/models/feedback.rb
require 'spec_helper'

describe Feedback do
  it "has a valid factory" do
    FactoryGirl.create(:feedback).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:feedback, :name => nil).should_not be_valid
  end
  it "is invalid without a comment" do
    FactoryGirl.build(:feedback, :comment => nil).should_not be_valid
  end
  it "has the name titleized" do
    fb = FactoryGirl.build(:feedback, :name => "beckham")
    fb.name.should be == "Beckham"
  end
end
