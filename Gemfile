source 'https://rubygems.org'
ruby "1.9.3"
gem 'rails', '~> 3.2'
gem 'slim'
gem 'simple_form'
gem 'simplecov', :require => false, :group => :test
gem 'rufus-scheduler' # to keep app loaded on heroku, prevent it from shutting down
gem 'compass'
gem 'compass-normalize'
gem 'faker'
gem 'validates_email_format_of', :git => 'https://github.com/jonathantribouharet/validates_email_format_of'

gem 'carrierwave'
gem 'cloudinary'

group :development do
  gem 'sqlite3'
  gem 'slim-rails'
end
group :production do
  gem 'pg'
end

group :development, :test do
  gem 'minitest-reporters'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2'
  gem 'coffee-rails', '~> 3.2'
  gem 'compass-rails'
  gem 'susy'
  gem 'compass-susy-plugin'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'sassy-buttons'
  gem 'uglifier', '>= 1.0'
  gem 'slim-rails'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'
