@students = []

def input_students
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
      @students << student
    end
    
  end
end

def interactive_menu
  loop do
    print_menu
    selection = gets.chomp
    process(selection)
  end
  
end

def load_students
  
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
  
end

def print_all_by_cohort
  
  print_header
  cohorts = {}
  
  @students.each do |student|
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

def print_by_cohort(cohort)
  
  counter = 1
  @students.each do |student|
    if student[:cohort] == cohort.to_sym
      puts "#{counter}. #{student[:name]}"
      counter += 1
    end
  end
  
end

def print_footer
  footer = "Overall, we have #{@students.count} great student"
  footer << "s" if @students.length > 1
  
  puts footer
  
end

def print_header
  puts "The students of Villains Academy\n---------------"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def print_shorter_than(number)
  
  puts "Student names shorter than #{number} characters:"
  counter = 0
  @students.each do |student|
    if student[:name].length < number
      counter += 1
      puts "#{counter}. #{student[:name]}"
    end
  end
  
end

def print_starting_with(letter)
  
  puts "Student names starting with letter #{letter}:"
  counter = 0
  @students.each do |student|
    if student[:name][0] == letter
      counter += 1
      puts "#{counter}. #{student[:name]}"
    end
  end
  
end

def print_students_list
  
  @students.each_with_index do |student, student_no|
    puts "#{student_no + 1}. #{student[:name]} (Cohort: #{student[:cohort]})"
  end
  
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def save_students
  # open file for writing
  file = File.open("students.csv", "w")
  
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  
  # close the file
  file.close
end

def show_students
  print_header
  print_students_list
  print_footer
end

# Run code
interactive_menu