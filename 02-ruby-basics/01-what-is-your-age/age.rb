puts "What is your name?"
name = gets.chomp # asks user to type something in the Terminal



puts "Ok got it!"

# TODO: your code goes here
 puts "What's your year of birth ? "
 birthyear = gets.chomp

puts "OK your birth year is #{birthyear}"
birthyear = birthyear.to_i

# p birthyear.class


age = 2021 - birthyear

puts "Hey #{name}! You are #{age} years old this year."
