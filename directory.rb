# Array of students currently enrolled

students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates",
]

# Print a list of students

puts "The students of Villains Academy\n---------------"

students.each do |student|
  puts student
end

# Prints the number of students

puts "Overall, we have #{students.count} great students"