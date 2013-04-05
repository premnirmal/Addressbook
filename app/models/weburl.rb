class Weburl < Url
  def self.prefix
    'http://'
  end
  def to_url
    return self.prefix + read_attribute(:name)
  end
end
