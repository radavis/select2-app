require "sinatra"
require "bundler/setup"
Bundler.require(:default, Sinatra::Application.environment)
Dotenv.load

enable :sessions
use Rack::Flash

get "/" do
  erb :form
end

get "/boilerplate" do
  erb :boilerplate
end

get "/cities" do
  cities = {
    cities: [
      { id: 1, name: "Vancouver, BC, Canada" },
      { id: 2, name: "Tampa, FL, USA" },
      { id: 3, name: "Reykjavik, Iceland" },
      { id: 4, name: "Yellowstone, WY, USA" },
      { id: 5, name: "Yosemite, CA, USA" },
      { id: 6, name: "San Francisco, CA, USA" },
      { id: 7, name: "New York City, NY, USA" },
      { id: 8, name: "Washington, D.C., USA" },
      { id: 9, name: "Chicago, IL, USA" },
      { id: 10, name: "Aspen, CO, USA" }
    ]
  }

  cities.to_json
end

post "/cities" do
  puts params
  flash[:notice] = "#{params} was POSTed to the server."
  redirect to("/")
end
