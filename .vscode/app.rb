require 'mysql2'

connection = Mysql2::Client.new(
	:host     => '127.0.0.1', 
	:username => 'root',     
	:password => '',    
	:database => 'RailsAPI',      
	:encoding => 'utf8'       
	)


puts "Choose any options"
puts "1) Display database data"
puts "2) Insert into database"
puts "3) Delete from database"
puts "--------------------------"
answer = gets.chomp

if(answer == '1') 
    results = connection.query("SELECT * FROM STUDENTS")
    results.each do |row|
      puts row
    end
end

if(answer == '2') 
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
end

if(answer == '3')
    results = connection.query("SELECT * FROM STUDENTS")
    results.each do |row|
      puts row
    end
    puts " "
    puts "Enter the id of student you wanna delete"
    id = gets.chomp
    id = id.to_i
    sql = "DELETE FROM STUDENTS WHERE ID=#{id}"
    connection.query(sql);
end






