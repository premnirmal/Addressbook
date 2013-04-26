class Entry < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :title, :avatar, :avatar_cache

  [:addresses, :emails, :weburls, :phonenumbers].each do |children|
    has_many children, dependent: :destroy
    attr_accessible "#{children}_attributes".intern
    accepts_nested_attributes_for children, allow_destroy: true,reject_if: :all_blank
  end

  validates :first_name, :last_name, :presence => true

  def title=(val)
    if val != nil
      write_attribute(:title, val.titleize)
    end
  end

  def first_name=(val)
    if val != nil
      write_attribute(:first_name, val.titleize)
    end
  end

  def last_name=(val)
    if val != nil
      write_attribute(:last_name, val.titleize)
    end
  end

  def name
    first_name + ' ' + last_name
  end
end
