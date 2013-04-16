class Url < ActiveRecord::Base
  belongs_to :entry
  belongs_to :address_type
  attr_accessible :name, :type, :address_type_id
  validates :name, :address_type_id, :presence => true
  validates :name, uniqueness: { scope: :entry_id }
  def prefix
    self.class.prefix
  end
  def self.prefix
    # :nocov:
    raise "Virtual method 'prefix' called!"
    # :nocov:
  end
end
