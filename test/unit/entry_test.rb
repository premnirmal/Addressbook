require 'test_helper'

class EntryTest < ActiveSupport::TestCase
	test "All Entry attributes must not be empty" do
		entry = Entry.new
		assert entry.invalid?
		assert entry.errors[:first_name].any?
  		assert entry.errors[:last_name].any?
  		assert entry.errors[:email].any?
	end

	test "Email must be valid" do
		entry = Entry.new(:first_name => "Richard",
						:last_name => "Nixon")
		

	end
end

		# entry.email = "richardnixon.com"
		# assert entry.invalid?
		# assert_equal "Must be a correct format of email, with an '@' symbol",
		# 	entry.errors[:email].join('; ')

		# entry.email = "richardnixon"
		# assert entry.invalid?
		# assert_equal "Must be a correct format of email, with an '@' symbol",
		# 	entry.errors[:email].join('; ')

		# entry.email = "richard@nixon"
		# assert entry.invalid?
		# assert_equal "Must be a correct format of email, with an '@' symbol",
		# 	entry.errors[:email].join('; ')

		# entry.email = "@nixon.com"
		# assert entry.invalid?
		# assert_equal "Must be a correct format of email, with an '@' symbol",
		# 	entry.errors[:email].join('; ')

		# entry.email = "richard@"
		# assert entry.invalid?
		# assert_equal "Must be a correct format of email, with an '@' symbol",
		# 	entry.errors[:email].join('; ')

		# entry.email = "richard@nixon.com"
		# assert entry.valid?