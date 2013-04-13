class Phonenumber < Url
  validates_length_of :name, maximum: 14
end
