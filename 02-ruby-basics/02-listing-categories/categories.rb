categories = ["Adventure", "Sport", "Visits", "Workshops", "Cultural", "Food"]
  # TODO: gather the categories of activity

#p categories

# TODO: your code goes here

puts "Hey! Can you enter a new teambuilding categorie?"
newcategory = gets.chomp
categories.push (newcategory)

categories = categories.sort

number = categories.count

categories.each do |name|
  puts "- #{name}"

end

puts "Total: #{number}"
