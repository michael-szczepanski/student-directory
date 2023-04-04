students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, hobby: "crime"},
  {name: "Darth Vader", cohort: :november, hobby: "crime"},
  {name: "Nurse Ratched", cohort: :january, hobby: "crime"},
  {name: "Michael Corleone", cohort: :november, hobby: "crime"},
  {name: "Alex DeLarge", cohort: :march, hobby: "crime"},
  {name: "The Wicked Witch of the West", cohort: :november, hobby: "crime"},
  {name: "Terminator", cohort: :november, hobby: "crime"},
  {name: "Freddy Krueger", cohort: :march, hobby: "crime"},
  {name: "The Joker", cohort: :november, hobby: "crime"},
  {name: "Joffrey Baratheon", cohort: :november, hobby: "crime"},
  {name: "Norman Bates", cohort: :march, hobby: "crime"}
]

students = []

def print_each(names)
  
  print_header
  names.each_with_index do |student, student_no|
    puts "#{student_no + 1}. #{student[:name]} (Cohort: #{student[:cohort]}, Hobby: #{student[:hobby]})"
  end
  
=begin
  print_header
  index = 0
  while index < names.length
    puts "#{index + 1}. #{names[index][:name]} (Cohort: #{names[index][:cohort]}, Hobby: #{names[index][:hobby]})"
    index += 1 
  end
=end
  
end

def print_all_by_cohort(names)
  
  print_header
  cohorts = {}
  
  names.each do |student|
    cohort = student[:cohort]
    
    if !cohorts.include?(cohort)
      cohorts[cohort.to_sym] = []
    end
    
    cohorts[cohort] << student[:name]
  end
  
  cohorts.each do |cohort, students|
    puts "#{cohort}: #{students}"
  end
  
end

def print_by_cohort(cohort, names)
  
  students = []
  names.each do |student|
    if student[:cohort] == cohort.to_sym
      students << student
    end
  end
  
  print_each(students)
  
end

def print_starting_with(letter, names)
  
  puts "Student names starting with letter #{letter}:"
  counter = 0
  names.each do |student|
    if student[:name][0] == letter
      counter += 1
      puts "#{counter}. #{student[:name]}"
    end
  end
  
end

def print_shorter_than(number, names)
  
  puts "Student names shorter than #{number} characters:"
  counter = 0
  names.each do |student|
    if student[:name].length < number
      counter += 1
      puts "#{counter}. #{student[:name]}"
    end
  end
  
end

def print_header
  puts "The students of Villains Academy\n---------------"
end

def print_footer(names)
  footer = "Overall, we have #{names.count} great student"
  footer << "s" if names.length > 1
  
  puts footer
  
end

def input_students
  students = []
  
  name = "Jane Doe"
  
  while true do
    puts "Please enter the name of the student you'd like to add."
    puts "Type finished once you're done"
    name = gets.chomp
    cohort = ""
    
    break if name.downcase == "finished"
    
    puts "Please enter the cohort you'd like to enroll this student in"
    cohort = gets.chomp
    
    puts "Name: #{name}, Cohort: #{cohort}"
    puts "If you'd like to add this student to the list, type 'yes'"
    answer = gets.chomp
    if answer.downcase == "yes"
      student = Hash.new('not specified')
      student[:name] = name
      student[:cohort] = cohort
      students << student
    end
    
  end
  
  return students
end

#students = input_students
#print_header
#print_each(students)
#puts ""

#Test code below
=begin
print_starting_with("D", students)
puts ""
print_shorter_than(12, students)
puts ""
print_all_by_cohort(students)
puts ""
print_by_cohort("november", students)
puts ""
=end



print_footer(students)