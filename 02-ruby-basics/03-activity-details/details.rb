activity = { "name" => "Apero", "Category" => "Bonne Ambiance", "City" => "Paris", "Duration" => 180, "Number of participant" => 15, "Price" => 100
  # TODO: gather the characteristics of your preferred activity
}
#p activity
# TODO: your code goes here

puts "#{activity["name"]} [ #{activity["Category"].upcase} ]"
puts "Located in #{activity["City"]}"
puts "Duration of #{activity["Duration"]} minutes"
puts "For #{activity["Number of participant"]} participants"
puts "Charged #{activity["Price"]}€"
