source 'https://rubygems.org'

gem 'activerecord', '~> 4.1'
gem 'pg'
gem 'rake'
gem 'sinatra', '~> 1.4'
gem 'sinatra-activerecord', '~> 2.0'
gem 'sinatra-contrib', require: false
gem 'sinatra-flash'
gem 'httparty'
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
gem 'browser'

group :test, :development do
  gem 'pry'
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
end

group :test do
  gem 'rspec', '~> 3.4'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'shoulda'
  gem 'shoulda-matchers', '~> 3.1', require: false
  gem 'valid_attribute'
end
