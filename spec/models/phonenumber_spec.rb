# spec/models/phonenumber_spec.rb
require 'spec_helper'

describe Phonenumber do
  it "has a valid factory" do
    entry = FactoryGirl.create(:entry)
    FactoryGirl.create(:phonenumber, entry: entry).should be_valid
  end
end
