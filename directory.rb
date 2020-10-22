# set instance variable accessible to all methods
@students = []
# set up interactive menu
def interactive_menu
  loop do
# 1. Print the menu and ask the user what they want to do
    print_menu
    process(gets.chomp)
  end #<-loop do
end #<-interactive_menu

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
end #<-print menu

def process(selection)
# do what the user has asked
    case selection
      when "1"
        input_students
      when "2"
        show_students
      when "9"
        exit
      else
        puts "I don't know what you mean. Try again."
      end #<- case selection
  end #<- interactive_menu

  def show_students
    print_header
    print_student_list
    print_footer
  end

# let's put all students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit enter twice"
# get the first name
  name = gets.chomp
# while the name is not empty, repeat this code
  while !name.empty? do
# add the student hash to the array
  @students << {name: name, cohort: :november}
  puts "Now we have #{@students.count} students"
# get another name from the user
  name = gets.chomp
  end
# doesnt need to return the array of students because of the instance variable
# students
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
#call the interactive_menu
interactive_menu
# call the methods
#students = input_students
#print_header
#print(students)
#print_footer(students)
