require 'test_helper'

class EntryTest < ActiveSupport::TestCase
	fixtures :entries # load entries fixtures (entires.yml)

	# test all entries are non-empty
	test "All Entry attributes must not be empty" do
		entry = Entry.new
    #assert entry.index
		assert entry.invalid?
		assert entry.errors[:first_name].any?
    assert entry.errors[:last_name].any?
  	assert entry.errors[:email].any?
	end

	test "Entry is not valid without a unique email" do
		entry = Entry.new(:email => entries(:homer_simpson_ok).email,
        	                :first_name => "Marge",
            	            :last_name => "Simpson")                	        
  		refute entry.save
  		assert_equal "has already been taken", entry.errors[:email].join('; ')
	end

	test "Email invalid" do
		entry = Entry.new(last_name: "Last",
                      first_name: "First")
    	entry.email = "xyz.com"
    	refute entry.valid?
    	assert_equal "Must be a valid email address!", entry.errors[:email].join('; ')
    	entry.email = "xyz@xyz.com"
    	assert entry.valid?
  	end
end