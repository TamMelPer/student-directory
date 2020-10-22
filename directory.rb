# set instance variable accessible to all methods
@students = []
# set up interactive menu
def interactive_menu
  loop do
# 1. Print the menu and ask the user what they want to do
    print_menu
    process(STDIN.gets.chomp)
  end #<-loop do
end #<-interactive_menu


def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end #<-print menu

def process(selection)
# do what the user has asked
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
        puts "I don't know what you mean. Try again."
      end #<- case selection
  end #<- interactive_menu

# let's put all students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit enter twice"
# get the first name
  name = STDIN.gets.chomp
# while the name is not empty, repeat this code
  while !name.empty? do
# add the student hash to the array
  @students << {name: name, cohort: :november}
  puts "Now we have #{@students.count} students"
# get another name from the user
  name = STDIN.gets.chomp
  end
# doesnt need to return the array of students because of the instance variable
# students
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end
def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer
# finally, we print the total number of students
  puts "Overall we have #{@students.count} great students"
end

def save_students
# open the file for writing
  file = File.open("students.csv", "w")
# iterate over the array of students
  @students.each do |student|
# put all elements of the hash into an array and then
# convert it all to the string
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
# we write this line to the file using the method puts()
    file.puts csv_line
  end #<- each do
# Every time you open file, it needs to be closed.
  file.close
end #<- save_students
# Make this method more flexible by passing the name as the argument. However,
# to preserve the original functionality, let's give it a default value.
def load_students(filename = "students.csv")
# if the argument is not supplied, then the value "students.csv" will be used
# (this time for reading)
  file = File.open(filename, "r")
# then we read all lines into an array and iterate over it.
  file.readlines.each do |line|
# On every iteration we discard the training new line character from the line,
# split it at the comma (this will give us an array with two elements)
# and assign it to the name and cohort variables.
  name, cohort = line.chomp.split(',')
# we have the name and the cohort, we create a new hash and put it into the list of students.
    @students << {name: name, cohort: cohort.to_sym}
  end #<- readlines.each.do
# Finally, we close the file.
file.close
end #<- load_students

def try_load_students
# First, we'll need to see if the argument is given.
  filename = ARGV.first
# If not, we just proceed as before and don't do anything.
  return if filename.nil?
# Then we need to check if the file exists.
  if File.exists?(filename)
# If the file is given and it exists, let's load it.
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
# If it doesn't, the user must have given us the incorrect file name, so
# let's show an error message and quit.
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end #<- if/else
end #<- try_load_students


#call the try_load menu before the interactive_menu
try_load_students
interactive_menu
# call the methods
#students = input_students
#print_header
#print(students)
#print_footer(students)
