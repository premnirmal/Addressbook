class Entry < ActiveRecord::Base
  has_many :addresses, :dependent => :destroy
  has_many :emails, :dependent => :destroy
  has_many :weburls, :dependent => :destroy
  has_many :phonenumbers, :dependent => :destroy

  accepts_nested_attributes_for :addresses, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :emails, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :weburls, :allow_destroy => true, :reject_if => :all_blank

  accepts_nested_attributes_for :phonenumbers, :allow_destroy => true, :reject_if => :all_blank

  attr_accessible :first_name, :last_name, :title, :addresses_attributes, :emails_attributes, :weburls_attributes, :phonenumbers_attributes

  validates :first_name, :last_name, :presence => true

  def title=(val)
    write_attribute(:title, val.titleize)
  end
  def first_name=(val)
    write_attribute(:first_name, val.titleize)
  end
  def last_name=(val)
    write_attribute(:last_name, val.titleize)
  end
  def name
    first_name + ' ' + last_name
  end
end
