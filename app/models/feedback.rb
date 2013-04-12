class Feedback < ActiveRecord::Base
  attr_accessible :comment, :email, :name
  validates :comment, :email, :name, :presence => true
  validates :email, :format => {
    :with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i,
    :message => "Must be a valid email address"
  }
  def name=(val)
    write_attribute(:name, val.titleize)
  end
end
