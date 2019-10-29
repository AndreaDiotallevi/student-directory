# Exercise 10: we've been using the chomp() method to get rid of the last return character.
# Find another method among those provided by the String class that could be used for the same purpose
# (although it will require passing some arguments).

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []
  # Get the first name
  name = gets.delete_suffix!("\n")
  # While the name is not empty, repeat this code
  while !name.empty? do
    # Add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # Get another name from the user
    name = gets.delete_suffix!("\n")
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
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
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
