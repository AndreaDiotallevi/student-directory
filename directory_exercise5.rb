# Exercise 5: our code only works with the student name and cohort. Add more information: hobbies, country of birth, height, etc.

def input_students
  puts "Please enter the names, hobbies and country of birth of the students, separated by a comma"
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []
  # Get the first name
  student_info = gets.chomp.split(",")
  # While the name is not empty, repeat this code
  while !student_info.empty? do
    # Add the student hash to the array
    students << {name: student_info[0], hobby: student_info[1], country_of_birth: student_info[2], cohort: :november}
    puts "Now we have #{students.count} students"
    # Get another name from the user
    student_info = gets.chomp.split(",")
  end
  # Return the array of input_students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (hobby: #{student[:hobby]}, country of birth: #{student[:country_of_birth]}, cohort: #{student[:cohort]})"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# Nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
