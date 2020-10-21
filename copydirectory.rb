# let's put all students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit enter twice"
# create an empty array
  students = []
# get the first name
  name = gets.chomp
  puts "What cohort is #{name} in?"
  cohort = gets.chomp
# while the name is not empty, repeat this code
  while !name.empty? && !cohort.empty? do
# add the student hash to the array
  students << {name: name, cohort: cohort}
  puts "Now we have #{students.count} students"
# get another name from the user
  puts "Please enter the names of the students"
  name = gets.chomp
  puts "What cohort is #{name} in?"
  cohort = gets.chomp
  end
# return the array of students
students
end

def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end
def print(students)
  students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(40)
  end
end
def print_footer(students)
# finally, we print the total number of students
  puts "Overall we have #{students.count} great students"
end
# call the methods
students = input_students
print_header
print(students)
print_footer(students)
