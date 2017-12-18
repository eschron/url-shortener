## Technologies
* Sinatra
* CSS3 
* PostgreSQL
* ActiveRecord
* RSpec, Capybara

## To run locally
* Install Ruby 2.3.3
* In a terminal, run `git clone https://github.com/eschron/url-shortener.git`
* Navigate to the project's root directory with `cd url-shortener`
* Run `bundle install`
* Run `rake db:create && rake db:setup`
* Run `ruby app.rb`
* Visit http://localhost:4567/ in your browser.

## To test
* This project uses the [sinatra-activerecord](https://github.com/janko-m/sinatra-activerecord)
* Run `rake db:test:prepare`
* Run `rspec`
* If you are having trouble with any of these commands, try prefixing them with `bundle exec`.

## TODO
* WIP on pending tests that have to do with API calls since I realized that I cannot use the RackTest driver to test a remote application or to access remote URLs.
