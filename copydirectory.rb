# ------------------- first menthod -----------------------
# let's put all students into an array
def input_students
  puts 'Please enter the name of the student. Hit enter if no students'
# create an empty array
  students = []
# get the first name
  name = gets.chomp
# get the month of the cohort
  puts 'Please enter the month of the cohort (first 3 letters)'
  cohort = gets.chomp.capitalize.to_sym
# Checking the spelling
# define the months to account for spelling error with user input
  months = [:Jan, :Feb, :Mar, :Apr, :May, :Jun, :Jul, :Aug, :Sep, :Oct, :Nov, :Dec]
# If the cohort is not empty (i.e. user has inputtted) and the input is not in
# the months array
    if !cohort.empty? && !months.include?(cohort)
# keep asking and get the input but break when the input is correct
    loop do
      puts 'Incorrect spelling. Please enter the month of the cohort (first 3 letters)'
      cohort = gets.chomp.capitalize.to_sym
      break if months.include?(cohort)
    end #<- end for my loop
    end #<- end for my if that checks spelling
# while the name is not empty, repeat this code
  while !name.empty? do
#if the cohort is empty, add  "unknown"
    if cohort.empty?
      cohort = :unknown
    end # <- the end to my if cohort empty
# while the name is not empty, add the student hash to the array
    students << { name: name, cohort: cohort }
# if only one student, singularize the puts statement
    if students.length == 1
      puts "We have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end # <- this is the end for the if/else
# get another name and cohort from the user
    puts 'Please enter the name of the student. Hit enter if no further students'
    name = gets.chomp
# don't ask for the cohort if the name is empty here
    if name.empty?
      break
    end
    puts 'Please enter the month of the cohort (first 3 letters).'
    cohort = gets.chomp.capitalize.to_sym
    if !cohort.empty? && !months.include?(cohort)
# keep asking and get the input but break when the input is correct
    loop do
      puts 'Incorrect spelling. Please enter the month of the cohort (first 3 letters)'
      cohort = gets.chomp.capitalize.to_sym
      break if months.include?(cohort)
    end #<- end for my loop
    end #<- end for my if that checks spelling
  end # <- this is the end for the while/do
# return the array of students
  students
end # <- this is the end for the method
# -----------------------------------------------------
def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

def print(students)
  months = students.map {|student| student[:cohort]}.uniq
    months.each do |cohort|
      students.each do |student|
# if the value int he cohort key matches the cohort in the block
        if student[:cohort] == cohort
# then put month + names assosiated with that month
        puts "#{cohort} students are #{student[:name]}"
      end #<-if condition
    end #<- student
  end #<-months
end

#def print(students)
#  students.each do |student|
#    puts "#{student[:name]} (#{student[:cohort]} cohort)"
#  end
#end

def print_footer(students)
  # finally, we print the total number of students
  puts "Overall we have #{students.count} great students"
end
# -----------------------------------------------------
# call the methods
students = input_students
print_header
print(students)
print_footer(students)
