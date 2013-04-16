class Email < Url
  validates :name, :email => true
  def self.prefix
    'mailto:'
  end
  def to_email
    return self.prefix + read_attribute(:name)
  end
end
