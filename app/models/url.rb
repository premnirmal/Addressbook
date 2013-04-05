class Url < ActiveRecord::Base
  belongs_to :entry
  attr_accessible :name, :type
end