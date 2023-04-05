def default_load
  
  puts "Would you like to load the default list of students? (y/n)"
  input = STDIN.gets.chomp
  if input == "y"
    CSV.foreach('students.csv') do |line|
      name, cohort = line
      @students << {name: name, cohort: cohort.to_sym}
    end
  end
    
end

def input_students
  
  while true do
    puts "Please enter the name of the student you'd like to add."
    puts "Type finished once you're done"
    name = STDIN.gets.chomp
    cohort = ""
    
    break if name.downcase == "finished"
    
    puts "Please enter the cohort you'd like to enroll this student in"
    cohort = STDIN.gets.chomp
    
    while !@cohorts.include?(cohort.downcase) do
      puts "I cannot enter the student into cohort: #{cohort}, please enter a valid cohort"
      cohort = STDIN.gets.chomp
    end
    
    puts "Name: #{name}, Cohort: #{cohort}"
    puts "If you'd like to add this student to the list, type 'yes'"
    answer = STDIN.gets.chomp
    if answer.downcase == "yes"
      student = Hash.new('not specified')
      student[:name] = name
      student[:cohort] = cohort
      @students << student
    end
  end
    
end

def load_students(filename = "students.csv")
  
  puts "Please choose a file to load from"
  filename = STDIN.gets.chomp
  
  if !File.exists?(filename)
    puts "Sorry, #{filename} doesn't exist"
  else
    CSV.foreach(filename) do |line|
      name, cohort = line
      @students << {name: name, cohort: cohort.to_sym}
    end
  end
  
end

def save_students
  
  puts "Please choose a file to save to"
  filename = STDIN.gets.chomp
  
  CSV.open(filename, "wb") do |csv|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv << student_data
    end
  end
  
end