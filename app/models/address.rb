class Address < ActiveRecord::Base
  belongs_to :entry
  attr_accessible :city, :state, :street, :zip, :entry_id
  #validates :city, :state, :street, :zip, :presence => true
  validates :zip, :presence => true
  validates :state, :format => {
  	:with => /^(?:A[KLRZ]|C[AOT]|D[CE]|FL|GA|HI|I[ADLN]|K[SY]|LA|M[ADEINOST]|N[CDEHJMVY]|O[HKR]|PA|RI|S[CD]|T[NX]|UT|V[AT]|W[AIVY])*$/,
    :message => "PLEASE ENTER A VALID STATE"
  }
  validates_length_of :state, :in => 2..2, :message => "Must be two characters only"
  validates_length_of :zip, :in => 0..5, :message => "MAX OF 5 DIGITS FOR ZIP"
  #validates :zip :length => { :minimum => 0, :maximum => 5}
  #format zip code w/ leading zeroes
  # def zip
  # 	"%05d" % read_attribute(:zip)
  # end

  def state=(val)
  	write_attribute(:state, val.upcase)
  end

end
