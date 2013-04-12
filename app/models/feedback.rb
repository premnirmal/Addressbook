class Feedback < ActiveRecord::Base
  attr_accessible :comment, :name
  validates :comment, :name, :presence => true
  def name=(val)
    write_attribute(:name, val.titleize)
  end
end
