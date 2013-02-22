require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  
	#test zip code must not be empty
	test "zip code must not be empty" do
		entry = Entry.new(:email => "jfk@whitehouse.org",
							:first_name => "John",
							:last_name => "Kennedy")
		assert entry.save
		address = entry.addresses.new(:state => "DC")
		assert address.invalid?
		assert address.errors[:zip].any?
		#refute_equal "zip code field cannot be blank", address.errors[:zip].join('; ')
	end

	test "zip code must be an integer" do
		entry = Entry.new(:email => "jfk@nwo.org",
							:first_name => "John",
							:last_name => "Kennedy")
		assert entry.save
		address = entry.addresses.new(:state => "DC", :zip => "HELLO")
		refute address.valid?
		assert_equal "is not a number", address.errors[:zip].join('; ')
	end

	test "State must be a valid US state" do
		entry = Entry.new(:email => "jfk@democrat.org",
							:first_name => "John",
							:last_name => "Kennedy")
		assert entry.save
		address = entry.addresses.new(:state => "PP", :zip => 10020)
		refute address.valid?
		assert_equal "PLEASE ENTER A VALID STATE", address.errors[:state].join('; ')
	end

end
