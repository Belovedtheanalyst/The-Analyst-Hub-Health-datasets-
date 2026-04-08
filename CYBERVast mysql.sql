create database Cybervast_DA;


create table students_DA( id int, firstname varchar(50),
 lastname varchar(50), gender char(10),
 telephone varchar(50), cities varchar(50), 
 postalcode varchar(50), age int
 );
 
 select * from students_DA;
 
 
 
drop table students_DA;
 
 select * from students_DA;
 
 
 insert into students_DA( id, firstname, lastname, gender, telephone, cities, postalcode, age)
 values
 ("1", "Temitope", "Ogundele", "Female", "08023456719", "Ikeja", "110023", "32");
 
 
 insert into students_DA( id, firstname, lastname, gender, telephone, cities, postalcode, age)
 values
 ("2", "David", "Ugochukwu", "Male", "08033456797", "Abeokuta", "221100", "26"),
 ("3", "Kevin", "Oduwole", "Male", "08054567811", "Akure", "332211", "27"),
 ("4", "Olaide", "Ogunnusi", "Female", "08066456701", "Ibadan", "250711", "30"),
 ("5", "Hassan", "Sanusi", "Male", "08022005678", "Ado-Ekiti", "567098", "31"),
 ("6", "Akinwale", "Shobode", "Male", "08023456451", "Kaduna", "367991", "35");
 
 insert into students_DA( id, firstname, lastname, gender, telephone, cities, postalcode, age)
 values
 ("7", "Temitope", "Okunlolo", "Male", "08026456781", "Ikeja", "110023" ,"26"),
 ("8", "Kamal", "Malik", "Male", "08023456756", "Kaduna", "367991", "38"),
  ("9", "Fetus", "Olasoji", "Male", "08023456756", "Ado-Ekiti", "567098" , "25"),
  ("10", "Adebimpe", "Odeleke", "Female", "08023456756","Abeokuta", "221100" , "24");
  
  insert into students_DA( id, firstname, lastname, gender, telephone, cities, postalcode, age)
 values
 ("11", "Abibat", "Alli", "Female", "08028456781", "Ikeja", "110023" ,"24"),
 ("12", "Isaiah", "Oluwafemi", "Male", "08053456756", "Kaduna", "367991", "30"),
  ("13", "Andrew", "Wonder", "Male", "08023456756", "Ibadan", "250711", "27"),
  ("14", "Bosede", "Omoniyi", "Female", "08023256756", "Ado-Ekiti", "567098", "27"),
  ("15", "Debby", "Atanda", "Female", "08063456756", "Ibadan", "250711", "25");
  
  
  
 select * from students_DA;
 
 show databases;
 
 
 select firstname , lastname , cities from students_DA;
 
 select * from students_DA;
 
 
 select id from students_DA;
 select firstname from students_DA;
 select lastname from students_DA;
 select gender from students_DA;
 select telephone from students_DA;
 
 select firstname, lastname from students_DA;
 select id, gender from students_DA;
 select lastname ,gender from students_DA;
 select firstname, telephone from students_DA;
 
 select firstname, gender, telephone from students_DA;
 
 
 select id,  firstname, lastname, gender, telephone from students_DA;
 
 select * from students_DA;
 
 select * from customers_table;
 
 show databases;
 show tables;
 
 show columns from customers_table;
 
 ##where mean (filter)
 
 
 
seLECT * FROM students_DA;
SELECT * FROM students_DA;
select * from students_DA;

# Distinct 
select distinct(gender) from students_DA;
select distinct(firstname) from students_DA;
select distinct(cities) from students_DA;


#limit
select * from students_DA
Limit 3;


select * from students_DA
Limit 4;

select * from students_DA
Limit 6;

#offsets
select * from students_DA;

select * from students_DA
limit 4 offset 3;


select * from students_DA
limit 5 offset 5;

select * from students_DA
limit 5 offset 6;

select * from students_DA
limit 4 offset 6;

select * from students_DA
limit 7 offset 3;


# filter 
 select * from students_DA
 where id = 4;
 
 select * from students_DA
 where id = 11;
 
  select * from students_DA
 where id = 15;
 select * from students_DA
 where id = 9;
 
 select * from students_DA
 where id = 8;
 
 select * from students_DA
 where gender = "Male";
 
 select * from students_DA
 where gender = "male";
 
 select * from students_DA
 where gender = "female";
 
 select * from students_DA
 where gender = 'female';
 
 select * from students_DA
 where age = 24;
 
 
 select * from students_DA
 where age = 27;
 
 select * from students_DA
 where age = 25;
 
 select * from students_DA
 where id = 5;
 
 select * from students_DA
 where id = 1;
 
 
 select * from students_DA
 where id = 6;
 
 select firstname from students_DA
 where firstname = "Akinwale";
 
  select  * from students_DA
 where firstname = "Akinwale";
 
 select  * from students_DA
 where firstname = "Debby";
 
 
 
 
 
 

 
 select * from students_DA
 where firstname = "Akinwale";
 
 
 select * from students_DA
 where firstname = "David";
 
 select * from students_DA
 where gender = "Male";
 
 select * from students_DA
 where gender = "Female";
 
 select * from students_DA
 where cities = "Ibadan";
 
 select * from students_DA
 where cities = "Kaduna";
 
 select * from students_DA
 where cities = "Ado-Ekiti";
 
 select * from students_DA
 where cities = "Akure";
 
 select * from students_DA
 where cities = "Abeokuta";
 
 select * from students_DA
 where cities = "Ikeja";
 
 
 select * from customers_table        ##     !=   
 where cities = "Akure";
 
 #=  =        !=
 
 select * from students_DA
 where cities = "Ibadan";
 
 select * from students_DA
 where cities != "Ibadan";
 
 
 select * from customers_table
 where cities != "Ibadan";
 
 
 select * from students_DA
 where cities != "Abeokuta";
 
 
 select * from students_DA
 where cities = "Abeokuta";
 
 
  select * from customers_table
 where cities != "Abeokuta";
 
  select * from students_DA
 where lastname = "Ugochukwu";
 
 
 # Comparsion operator and Logical operators 
 #(=,!=, > , <, >=, <=, between (3 and 5))
 
 # Comparsion operator is sql
 
 # = means (equal to) =15
 # != Means (not equal to) != not equal to 15
 # > means ( greater than)  >15 (16,17,18,19,20 and above)
 # >= means (greater than equal to) >=15 (15, 16,17,18,19 ,20 and above)
 
 # < means(less than) <15 (0, 1,2,3,4,5,6,7,8,9,10,11,12,13,14)
 # <= means( less than equal to) <=15 (0, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)
 
 # between means from lower and upper values ( it can be 3 and 5) 3,4 ,5
 
 
 
 
  # Comparsion operator is sql
  
 select * from students_DA
 where id != 3;
 
  select * from students_DA
 where id = 3;
 
 
  select * from students_DA
 where id between 2 and 4;
 
 select * from students_DA
 where id between 1 and 4;
 
  select * from  students_DA
 where id between 3 and 5;
 
 
 select * from customers_table;
 
 
 select firstname, age from customers_table;
 
  select firstname, gender, age from customers_table;
  
   
  select firstname, gender, age from students_DA
  where gender = "Male";
 
 select firstname, gender, age from students_DA
  where gender = "Female";
  
  select avg(age) from  customers_table;
  
  
    select round(avg(age)) from  customers_table;
    
    #comparsion 
    
     select * from students_DA
    where age < 29;
    
     select * from  students_DA
    where age <= 29;
    
    select * from students_DA
    where age < 27;
    
    select * from students_DA
    where age <= 27;
    
    select * from students_DA
    where age = 26;
    
     select * from  students_DA
    where age != 26;
    
    
    select * from  students_DA
    where age < 26;
    
     select * from  students_DA
    where age <= 26;
    
    select * from  students_DA
    where age > 29;
    
    
     select * from  students_DA
    where age >= 29;
    
     select * from  students_DA
    where age > 30;
    
     select * from  students_DA
    where age = 30;
    
    select * from  students_DA
    where age >= 30;
    
    
      select * from  customers_table
    where age > 26;
    
      select * from  customers_table
    where age >= 26;
    
 # between 24 and 28
  
   select * from  students_DA
    where age between 24 and 28;
    
     select * from  students_DA
    where age between 30 and 40;
    
 #order by means (sorting) asc or desc
 
 select * from  students_DA
 order by cities ;
 
 select * from  students_DA
 order by cities asc;
 
  select * from  students_DA
 order by cities desc;
 
  select * from  students_DA
 order by age asc;
 
 select * from  students_DA
 order by age desc;
 
 select * from  students_DA
 order by firstname desc;
 
 select * from  students_DA
 order by firstname asc;
 
 select * from  students_DA
 order by gender asc;
 
  select * from  students_DA
 order by gender desc;
 
 #where (filter) and order by (sorting)
 
 
 select * from  students_DA
  where gender = "Male"
 order by age ;
 
 
 select * from  students_DA
  where gender = "Male"
 order by age asc;
 
 
  select * from  students_DA
  where gender = "Male"
 order by age desc;
 
 
  select * from  students_DA
  where gender = "Female"
 order by age ;
 
  select * from  students_DA
  where gender = "Female"
 order by age asc;
 
 select * from  students_DA
  where gender = "Female"
 order by age desc;
 
 
 select * from  students_DA
  where gender = "Male"
 order by age desc
 limit 3;
 
 select * from  students_DA
  where gender = "female"
 order by age desc
 limit 3;
 
 select * from  students_DA
  where gender = "Male"
 order by age asc
 limit 3;
 
 
  select * from  students_DA
  where gender = "Male"
 order by age asc
 limit 3 offset 2;
 
 
 #between for sql 
 
 SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
 
 select * from  students_DA
  where id between 3 and 7
  order by age ;
  
 select * from  students_DA
  where id between 3 and 7
  order by cities;
  
 
 
  select * from  students_DA
  where age between 24 and 27
  order by age ;
  
  
   select * from  students_DA
  where age between 24 and 27
  order by age desc;
  
  #Logical Operator (and, or, in , not)
  #and
   select * from  students_DA
   where gender = "female" and cities = "ibadan";
   
   
    select * from  students_DA
   where gender = "Male" and cities = "ibadan";
   
   select * from  students_DA
   where gender = "female" or cities = "ibadan";
   
   select * from  students_DA
   where gender = "male" or cities = "ibadan";
   
   
  select * from  students_DA
   where gender = "female" and cities = "Akure";
  
    select * from  students_DA
   where gender = "female" or cities = "Akure";
  
  select * from  students_DA;
  
  #IN Command (replace or)

    select * from  students_DA
    where cities = "Ikeja";
  
  select * from  students_DA
    where cities = "Akure";
    
    select * from  students_DA
    where cities = "Ibadan";
    
    select * from  students_DA
    where cities = "Ikeja"
    or cities = "Akure"
    Or cities = "ibadan";
  
  select * from  students_DA
    where cities IN( "Ikeja",
     "Akure","ibadan");

  
  select * from  students_DA
    where cities = "Abeokuta"
    or cities = "Kaduna"
    or cities = "ibadan";
  
  
   select * from  students_DA
    where cities in ("Abeokuta","Kaduna","ibadan"); #include
  
 
 select * from  students_DA
    where cities not in ("Abeokuta","Kaduna","ibadan"); #exclude
    
     select * from  students_DA;
     
     #concat
     
     select firstname, lastname, 
     concat(firstname,' ',lastname) from students_DA;
  
  select firstname, lastname, 
     concat(firstname,',   ',cities) from students_DA;
  
   select firstname, lastname, 
     concat(firstname,',   ',cities, ' ',age) from students_DA;
     
     
  select firstname, lastname, 
     concat(firstname,' ',lastname) as fullname
     from students_DA;
  
 students_DA
 
 #fully qualified name
 
##customers_table.id,
 ## customers_table.firstname,
  # customers_table.lastname,
    #customers_table.gender,
   #  customers_table.telephone,
    #  customers_table.city,
    #   customers_table.postalcode,
      #  customers_tale.age
         #customers_table;
         
         select customers_table.id, customers_table.firstname,
  customers_table.lastname, customers_table.gender,
    customers_table.telephone, customers_table.cities,
       customers_table.postalcode, customers_table.age
         from customers_table;
         
       select customers_table.id, customers_table.firstname
       from customers_table;
       
       select id, firstname from customers_table;
       
       #order by means (sorting) asc or desc
       
       select * from customers_table
       order by firstname asc;
       
       select * from customers_table
       order by firstname desc;
       
       
       
       select * from customers_table
       order by lastname asc;
       
       select * from customers_table
       order by lastname desc;
       
       select * from customers_table
       order by cities desc;
       
   select * from customers_table
       order by cities asc;
       
        select * from customers_table
       order by age asc;
       
         select * from customers_table
       order by age desc
       limit 5;
       
        select * from customers_table
        where gender = "Female"
       order by age desc
       limit 5;
       
       #To find the names of the customers between 30 to 40 years of age,
       #set up the query as seen here:
       
       
       select * from customers_table
       where age >=30 and age >=38;
       
       select * from customers_table
       where age >=30 or age >=38
       order by age;
       
       
       select * from customers_table
       where age >=30 and age <=38;
       
      select * from customers_table
       where age <=30 or age <=38;
       
       SELECT * FROM customers_table
WHERE cities = "Ikeja"  and 
age = 32;


SELECT * FROM customers_table
WHERE cities = "Ikeja"  or
age = 32;
       
       
       #IN
   SELECT * FROM customers_table
WHERE cities = "Ikeja"  or
age = 32;
          
          
 SELECT * FROM customers_table
WHERE cities = "Ikeja"  or
cities = "Akure";


SELECT * FROM customers_table
WHERE cities in("Ikeja" , "Akure");

SELECT * FROM customers_table
WHERE cities = "Ikeja"  or
cities = "Akure" or
cities = "Abeokuta";


SELECT * FROM customers_table
WHERE cities in("Ikeja" , "Akure", "Abeokuta");

SELECT * FROM customers_table 
WHERE cities = 'Ibadan' OR cities = 'Kaduna';


SELECT * FROM customers_table 
WHERE cities = 'Ibadan' or cities = 'Kaduna'
and age = 30;


SELECT * FROM customers_table 
WHERE cities = 'Ibadan' or cities = 'Kaduna'
and age = 35;
SELECT * FROM customers_table 
WHERE cities = 'Ibadan' or cities = 'Kaduna'
and age >= 35;


#OR , #IN
SELECT * FROM customers_table 
WHERE cities = 'Ibadan' 
or cities = 'Kaduna'
or cities = 'Akure'
or cities = 'Abeokuta';

SELECT * FROM customers_table 
WHERE cities in('Ibadan','Kaduna','Akure','Abeokuta');

#not

SELECT * FROM customers_table 
WHERE cities not in('Ibadan','Kaduna','Akure','Abeokuta');

#Concate means joining one or more text together 4xmple : Temitope Ogundele
select firstname , lastname, concat(firstname, ' ' ,lastname
) , gender 
from
 customers_table ;



select firstname , lastname, concat(firstname, ' ' ,lastname
) as  Full_Name,  gender 
from
 customers_table ;


select firstname , lastname, concat(firstname, ' ' ,lastname
) as  d,  gender 
from
 customers_table ;
                   
      
select firstname , lastname, concat(firstname, ', ' ,cities
) as  First_city,  gender 
from
 customers_table ;
 
 
 select  concat(firstname, ', ' ,cities, '  ',age
) as  First_city,  gender 
from
 customers_table ;
      