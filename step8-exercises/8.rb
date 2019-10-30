# Exercise 8: Once you complete the previous exercise, change the way the users are displayed:
# print them grouped by cohorts. To do this, you'll need to get a list of all existing cohorts
# (the map() method may be useful but it's not the only option), iterate over it and only
# print the students from that cohort.

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

def print(students, selected_cohort)
  puts "Students from the #{selected_cohort} cohort:"
  selected_students = students.select { |student| student[:cohort] == selected_cohort }
  selected_students.each do |student|
    puts student[:name]
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# Nothing happens until we call the methods
students = input_students
print_header
selected_cohort = :november
print(students, selected_cohort)
print_footer(students)
