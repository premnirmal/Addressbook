# spec/models/address_spec.rb
require 'spec_helper'

describe Address do
  it "has a valid factory" do
    entry = FactoryGirl.create(:entry)
    FactoryGirl.create(:address, entry: entry).should be_valid
  end

  it "is invalid without a zip" do
    entry = FactoryGirl.create(:entry)
    FactoryGirl.build(:address, entry: entry, :zip => nil).should_not be_valid
  end

  it "is invalid with an alphabetic zip" do
    entry = FactoryGirl.create(:entry)
    FactoryGirl.build(:address, entry: entry, :zip => "alphabetic").should_not be_valid
  end

  it "is invalid with a state of size != 3" do
    entry = FactoryGirl.create(:entry)
    FactoryGirl.build(:address, entry: entry, :state => 'CAA').should_not be_valid
    FactoryGirl.build(:address, entry: entry, :state => 'C').should_not be_valid
  end

  it "is invalid without an address_type" do
    entry = FactoryGirl.create(:entry)
    FactoryGirl.build(:address, entry: entry, :address_type_id => nil).should_not be_valid
  end
end
