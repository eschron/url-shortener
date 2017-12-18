require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'httparty'
require 'json'
require 'uri'
require 'faker'
require 'browser'

enable :sessions

set :bind, '0.0.0.0'  # bind to all interfaces

configure :development, :test do
  require 'pry'
end

configure do
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end


# home/landing page. Input form for url.
get '/' do
  @title = 'URL Shortener'
  response = HTTParty.get('http://localhost:4567/api/v1/urls')
  @res = response
  @timenow = DateTime.parse(Time.now.to_s)
  erb :index
end

# redirect to target url (detecting mobile, tablet, desktop), update redirects count.
get '/:id' do
  if params[:id] != "favicon.ico"
    browser = Browser.new request.user_agent, accept_language: request.env["HTTP_ACCEPT_LANGUAGE"]
    url = Url.where(shortened_url: params[:id]).first

    if url
      count = url["redirect_count"]
      url.update(redirect_count: count+1)
      response = HTTParty.get("http://localhost:4567/api/v1/urls/#{params[:id]}")
      orig = JSON.parse(response.body)["original_url"]

      if browser.device.tablet?
        tablet = orig.gsub(/www\./,"t.")
        redirect tablet
      elsif browser.device.mobile?
        mobile = orig.gsub(/www\./,"m.")
        redirect mobile
      else
        redirect orig
      end

    else
      flash[:error] = "Not an existing shortened url. Not valid"
      redirect '/'
    end
  else
    redirect '/'
  end
end

# get json of specific url
get '/api/v1/urls/:id' do
  content_type :json
  url = Url.where(shortened_url: params[:id]).first
  halt(404, { message:'Url Not Found'}.to_json) unless url
  url.to_json
end

# get all urls
get '/api/v1/urls' do
  content_type :json
  Url.all.to_json
end

# post to database new url
post '/api/v1/urls' do
  content_type :json
  if params['original_url'] =~ /\A#{URI::regexp(['http', 'https'])}\z/
    if Url.all.where(original_url: params['original_url']).length > 0
      url = Url.where(original_url: params['original_url']).first
      Url.all.where(original_url: params['original_url']).to_json
      url = "http://localhost:4567/#{url.shortened_url}"
      flash[:message] = "This url already exists, here is the shortened url:"
      flash[:url] = url
      redirect '/'
    else
      number_of_characters = 10
      if Faker::UniqueGenerator::RetryLimitExceeded
        number_of_characters = 12
      end
      x = Faker::Lorem.unique.characters(number_of_characters)

      url = Url.new(original_url: params['original_url'], shortened_url: x)
      if url.save
        url.to_json
        url = "http://localhost:4567/#{url.shortened_url}"
        flash[:message] = "Here is your shortened url:"
        flash[:url] = url
        redirect '/'
      else
        halt 500
      end
    end
  else
    flash[:error] = "Not a valid url. Please enter a url in the format: http://www.example.com/path"
    {:status => 500}.to_json
    redirect '/'
  end

end
