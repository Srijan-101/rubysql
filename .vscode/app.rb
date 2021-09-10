require 'mysql2'


connection = Mysql2::Client.new(
	:host     => '127.0.0.1', 
	:username => 'root',     
	:password => '',    
	:database => 'RailsAPI',      
	:encoding => 'utf8'       
	)

answer = 0
while (answer != 6) do
  puts "--------------------------"
  puts "Choose an options"
  puts "--------------------------"
  puts "1) Display all students"
  puts "2) Show specific student"
  puts "3) Create a student"
  puts "4) Update a student"
  puts "5) Delete a student"
  puts "6) Quit"
  puts "--------------------------"
  
  answer = gets.chomp
  answer = answer.to_i
  
  case answer

     when 1
     puts"Displaying records from database\n"
     results = connection.query("SELECT * FROM STUDENTS")
        print "Id\t" 
        print "Name\t" 
        print "Age\t" 
        print "Address\t" 
        puts " "
     results.each do |row|
        print "#{row['ID']}\t" 
        print "#{row['NAME']}\t" 
        print "#{row['AGE']}\t" 
        print "#{row['ADDRESS']}\t" 
        puts ""
     end
     


     when 2
        puts "Enter Id of student"
        id = gets.chomp
        id = id.to_i
        results = connection.query("SELECT * FROM STUDENTS WHERE ID=#{id}")
        print "Id\t" 
        print "Name\t" 
        print "Age\t" 
        print "Address\t" 
        puts " "
        results.each do |row|
          print "#{row['ID']}\t" 
          print "#{row['NAME']}\t" 
          print "#{row['AGE']}\t" 
          print "#{row['ADDRESS']}\t" 
          puts ""
        end


      when 3 
        puts "Enter ID number"
        id = gets.chomp
        id = id.to_i
        puts "Enter your name"
        name = gets.chomp
        puts "Enter your age"
        age = gets.chomp
        age = age.to_i
        puts "Enter your address"
        address = gets.chomp
        sql = "INSERT INTO STUDENTS VALUES(#{id},'#{name}',#{age},'#{address}')"
        connection.query(sql);
      

    when 4
       puts "Enter the ID of student you wanna update for"
       id = gets.chomp
       id = id.to_i
       puts "Which field you wanna update"
       field = gets.chomp
       field = field.upcase 

       puts "Enter the new value for field #{field} for ID #{id}"
       value = gets.chomp
       
       sql = "UPDATE STUDENTS SET #{field} = '#{value}' WHERE ID= #{id}"
       connection.query(sql);
    

  when 5
    puts "Enter the id of student you wanna delete"
    id = gets.chomp
    id = id.to_i
    sql = "DELETE FROM STUDENTS WHERE ID=#{id}"
    connection.query(sql);

 when 6  
  break
 end
end

connection.close









