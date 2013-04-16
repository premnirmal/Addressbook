class Weburl < Url
  validates_format_of :name, :with => URI::regexp(%w(http https))
  def self.prefix
    'http://'
  end
  def to_url
    return self.prefix + read_attribute(:name)
  end
end
