@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
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
      puts "I don't know what you mean, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    add_student(name)
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
  @students
end

def add_student(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  filename = get_filename
  if File.exist?(filename)
    file = File.open(filename, "w")
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    file.close
  else
    puts "The file name you typed doesn't exist"
  end
end

def load_students
  filename = get_filename
  if File.exist?(filename)
    file = File.open(filename, "r")
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      add_student(name, cohort)
    end
    puts "Loaded #{@students.count} from #{filename}"
    file.close
  else
    puts "The file name you typed doesn't exist"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def get_filename
  puts "Type the filename you want to use"
  gets.chomp
end

interactive_menu
