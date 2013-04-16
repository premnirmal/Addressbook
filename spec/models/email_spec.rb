# spec/models/email_spec.rb
require 'spec_helper'

describe Email do
  it "has a valid factory" do
    entry = FactoryGirl.create(:entry)
    FactoryGirl.create(:email, entry: entry).should be_valid
  end
  it "has a valid prefix" do
    entry = FactoryGirl.create(:entry)
    email = FactoryGirl.create(:email, entry: entry)
    email.to_email.should be == (email.prefix + email.name)
  end
  it "is invalid with an invalid email address" do
    entry = FactoryGirl.create(:entry)
    FactoryGirl.build(:email, entry: entry, :name => 'wrong email').should_not be_valid
  end
end
