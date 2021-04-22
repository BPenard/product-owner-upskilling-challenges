require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  @activities = [
    { "name" => "Apero", "Category" => "Bonne Ambiance", "City" => "Paris", "Duration" => 180, "Number of participant" => 15, "Price" => 100},
    { "name" => "Perudo", "Category" => "Jeu", "City" => "Nantes", "Duration" => 35, "Number of participant" => 5, "Price" => 10},
    { "name" => "Foot", "Category" => "Sport", "City" => "Marseille", "Duration" => 90, "Number of participant" => 22, "Price" => 1000}

  ]


  erb :index
end

get "/components" do
  erb :components
end
