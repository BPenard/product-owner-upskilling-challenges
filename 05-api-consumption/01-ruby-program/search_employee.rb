require "json"
require "rest-client"

puts "What is the name of the employee you're looking for? (e.g. Bob Dylan)"
name = gets.chomp # asks user to type something in the Terminal

puts "Ok got it! Let's search for that person..."


first_name = name.split[0]
last_name = name.split[1]


#first_name = "Laura"
#last_name = "Olive"


url ="https://team-building-api.cleverapps.io/v2/employees"
response = RestClient.get(url , params: {"first_name"=> first_name , "last_name"=> last_name})
employees = JSON.parse (response.body)


user = employees["employees"][0]

puts "#{user["first_name"]} #{user["last_name"]} (#{user["job_title"]})"
puts "From team #{user["team"]["name"]}"
puts "Working from #{user["site"]["name"]} "
