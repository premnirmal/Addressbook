class Entry < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  validates :first_name, :last_name, :email, :presence => true
  validates :email, :uniqueness => true,
  	:format => {
  	:with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i, 
  	#regular expression to validate email http://rawsyntax.com/blog/rails-3-email-validation/
  	:message => 'Must be a valid email address!'
  }
  has_many :addresses, :dependent => :destroy
end
