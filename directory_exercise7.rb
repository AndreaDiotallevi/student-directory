# Exercise 7: in the input_students method the cohort value is hard-coded.
# How can you ask for both the name and the cohort?
# What if one of the values is empty? Can you supply a default value?
# The input will be given to you as a string? How will you convert it to a symbol? What if the user makes a typo?

def input_students
  puts "Please enter the names and cohorts of the students"
  puts "To finish, just hit return three times"
  students = []
  name = gets.chomp
  cohort = gets.chomp
  i = 0
  while !name.empty? || !cohort.empty? do
    i += 1
    if name.empty?
      name = "student number #{i}"
    end
    if cohort.empty?
      cohort = "november"
    end
    students << {name: name.to_sym, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    cohort = gets.chomp
  end
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
