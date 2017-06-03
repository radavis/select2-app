require "sinatra"
require "bundler/setup"
Bundler.require(:default, Sinatra::Application.environment)
Dotenv.load

get "/" do
  public_folder = Sinatra::Application.public_folder
  index_html = File.join(public_folder, "index.html")
  send_file(index_html)
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
  redirect to("/")
end
