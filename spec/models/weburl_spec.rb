# spec/models/weburl_spec.rb
require 'spec_helper'

describe Weburl do
  it "has a valid factory" do
    entry = FactoryGirl.create(:entry)
    FactoryGirl.create(:weburl, entry: entry).should be_valid
  end
  it "has a valid prefix" do
    entry = FactoryGirl.create(:entry)
    weburl = FactoryGirl.create(:weburl, entry: entry)
    weburl.to_url.should be == (weburl.prefix + weburl.name)
  end
  it "is invalid with an invalid url" do
    entry = FactoryGirl.create(:entry)
    FactoryGirl.build(:weburl, entry: entry, :name => 'wrong url').should_not be_valid
  end
end
