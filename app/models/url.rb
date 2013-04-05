class Url < ActiveRecord::Base
  belongs_to :entry
  attr_accessible :name, :type
  def prefix
    self.class.prefix
  end
  def self.prefix
    # :nocov:
    raise "Virtual method 'prefix' called!"
    # :nocov:
  end
end
