require "json"
require "rest-client"

puts "What is the team of the employees you're looking for? (e.g. UI / UX)"
team = gets.chomp # asks user to type something in the Terminal

puts "Ok got it! Let's search for the employees..."

#team ="UI"

url ="https://team-building-api.cleverapps.io/v2/teams"
response = RestClient.get(url , params: {"search"=> team })
response = JSON.parse (response.body)

#p"response"
#p response

found_team = response["teams"][0]



url ="https://team-building-api.cleverapps.io/v2/employees"
response = RestClient.get(url , params: {"team_id"=> found_team["id"]})
employees = JSON.parse (response.body)

employees = employees["employees"]

employees.each do |person|
  puts "#{person["first_name"]} #{person["last_name"]}"
  puts "#{person["job_title"]}"

  puts "---"
end
