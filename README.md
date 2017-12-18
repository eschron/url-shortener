## Technologies
* Frontend: Sinatra
* Database: PostgreSQL
* Testing: RSpec, Capybara

## To run locally
* Install Ruby
* In a terminal, run git clone `https://github.com/`
* Navigate to the project's root directory with `cd joor-assessment`
* Run `bundle install && rake db:setup`
* In a separate terminal, run `ruby app.rb`
* Visit http://localhost:4567/ in your browser.

## To Test
* This project uses the [sinatra-activerecord](https://github.com/janko-m/sinatra-activerecord)
* Run `rake db:test:prepare`
* Run `rspec`
* If you are having trouble with any of these commands, try prefixing them with `bundle exec`.
