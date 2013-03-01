require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  	fixtures :entries
  	fixtures :addresses
	
	#test zip code must not be empty
	test "zip code must not be empty" do
		entry = Entry.new(:email => "jfk@whitehouse.org",
							:first_name => "John",
							:last_name => "Kennedy")
		assert entry.save
		address = entry.addresses.new(:state => "DC")
		assert address.invalid?
		assert address.errors[:zip].any?
	end

	test "zip code must be an integer" do
		entry = Entry.new(:email => "jfk@nwo.org",
							:first_name => "John",
							:last_name => "Kennedy")
		assert entry.save
		address = entry.addresses.new(:state => "DC", :zip => "HELLO", :address_type_id => 2)
		refute address.valid?
		assert_equal "is not a number; is the wrong length (should be 5 characters)", address.errors[:zip].join('; ')
	end

	test "State must be a valid US state" do
		entry = Entry.new(:email => "jfk@democrat.org",
							:first_name => "John",
							:last_name => "Kennedy")
		assert entry.save
		address = entry.addresses.new(:state => "PP", :zip => 10020, :address_type_id => 1)
		refute address.valid?
		assert_equal "PLEASE ENTER A VALID STATE", address.errors[:state].join('; ')
	end

	test "check update" do
		entry = Entry.new(:email => "jfk@usa.org",
							:first_name => "John",
							:last_name => "Kennedy")
		assert entry.save
		address = entry.addresses.new(:state => "DC", :zip => 55555, :address_type_id => 2)
		assert address.save
		address.update_attributes(:state => "CC")
		refute address.valid?
		assert_equal "PLEASE ENTER A VALID STATE", address.errors[:state].join('; ')

	end
end
