require "sinatra"
require "sinatra/json"
require "sinatra/link_header"
require "sinatra/namespace"
require "sinatra/reloader" if development?

require "sqlite3"

enable :static

DB_PATH = File.join(__dir__, "db/team_building.sqlite")
DB      = SQLite3::Database.new(DB_PATH)
DB.results_as_hash = true

before do
  if request.get_header("CONTENT_TYPE") == "application/json"
    params.merge!(JSON.parse(request.body.read))
  end
end

get "/" do
  json "name" => "Team Building API", "status" => "Running"
end

namespace "/v1" do
  get "/activities" do
    activities = DB.execute ("SELECT * FROM activities ORDER BY name")

    json "activities" => activities
  end

  get "/activities/:id" do
    activities = DB.execute ("SELECT * FROM activities WHERE id = #{params["id"]} ")

    json "activities" => activities.first
  end

end

namespace "/v2" do
  get "/activities" do

    city =params["city"]
    category = params["category"]
    search = params["search"]

    if city != nil
      activities = DB.execute ("SELECT * FROM activities WHERE lower(city) = '#{city.downcase}' " )


    elsif category != nil
      activities = DB.execute ("SELECT * FROM activities WHERE lower(category) = '#{category.downcase}' " )


    elsif search != nil
      activities = DB.execute ("SELECT * FROM activities WHERE lower(name) LIKE '%#{search.downcase}%' " )

    else
      activities = DB.execute ("SELECT * FROM activities ORDER BY name " )

    end
    json "activities" => activities
  end

  get "/activities/:id" do
    activities = DB.execute ("SELECT * FROM activities WHERE id = #{params["id"]} ")

    json "activities" => activities.first
  end

end


namespace "/doc" do
  get { erb :"doc/index" }

  namespace "/v1" do
    get "/activities" do
      erb :"doc/v1/activities"
    end
  end

  namespace "/v2" do
    get "/activities" do
      erb :"doc/v2/activities"
    end
  end
end
