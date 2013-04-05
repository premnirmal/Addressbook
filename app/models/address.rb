class Address < ActiveRecord::Base
  belongs_to :entry
  belongs_to :address_type
  attr_accessible :city, :state, :street, :zip, :entry_id, :address_type_id
  
  validates :zip, :presence => true
  validates :zip, :numericality => { :greater_than => 0 }
  validates :state, :format => {
  	:with => /^(?:A[KLRZ]|C[AOT]|D[CE]|FL|GA|HI|I[ADLN]|K[SY]|LA|M[ADEINOST]|N[CDEHJMVY]|O[HKR]|PA|RI|S[CD]|T[NX]|UT|V[AT]|W[AIVY])*$/,
    :message => "Enter a valid US state"
  }
  validates_length_of :zip, is: 5
  validates_length_of :state, is: 2
  
  def state=(val)
  	write_attribute(:state, val.upcase)
  end

end
