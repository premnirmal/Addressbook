class Address < ActiveRecord::Base
  belongs_to :entry
  attr_accessible :city, :state, :street, :zip, :entry_id
  validates :city, :state, :street, :zip, :presence => true
  validates :state, :length => { :minimum => 2 }, :format => {
  	:with => /^(?:A[KLRZ]|C[AOT]|D[CE]|FL|GA|HI|I[ADLN]|K[SY]|LA|M[ADEINOST]|N[CDEHJMVY]|O[HKR]|PA|RI|S[CD]|T[NX]|UT|V[AT]|W[AIVY])*$/,
    :message => "Only two letters for valid US state allowed"
  }
  # format zip code w/ leading zeroes
  # def zip
  # 	"%05d" % read_attributes(:zip)
  # end

  def state=(val)
  	write_attribute(:state, val.upcase)
  end

end
