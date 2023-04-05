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
    puts "3. Save the list of students"
    puts "4. Load the list of students"
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