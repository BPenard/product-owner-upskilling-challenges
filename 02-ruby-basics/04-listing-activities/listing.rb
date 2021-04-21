activities = [
  { "name" => "Apero", "Category" => "Bonne Ambiance", "City" => "Paris", "Duration" => 180, "Number of participant" => 15, "Price" => 100},
  { "name" => "Perudo", "Category" => "Jeu", "City" => "Nantes", "Duration" => 35, "Number of participant" => 5, "Price" => 10},
  { "name" => "Foot", "Category" => "Sport", "City" => "Marseille", "Duration" => 90, "Number of participant" => 22, "Price" => 1000}
]

# TODO: your code goes here
 p activities

activities.each do |artist|
  puts "#{artist["name"]} [ #{artist["Category"].upcase} ]"
  puts "Located in #{artist["City"]}"
  puts "Duration of #{artist["Duration"]} minutes"
  puts "For #{artist["Number of participant"]} participants"
  puts "Charged #{artist["Price"]}€"

  puts "---"
end
