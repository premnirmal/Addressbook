class Address < ActiveRecord::Base
  belongs_to :entry
  belongs_to :address_type
  attr_accessible :city, :state, :street, :zip, :entry_id, :address_type_id
  
  validates :zip, :address_type_id, :state, :presence => true
  validates_length_of :zip, is: 5
  validates_length_of :state, is: 2
  
  def state=(val)
    write_attribute(:state, val.upcase)
  end

  def city=(val)
    write_attribute(:city, val.titleize)
  end
  
end
