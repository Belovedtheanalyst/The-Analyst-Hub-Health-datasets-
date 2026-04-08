create database students_record;

create table admission_date(student_matric_no int, firstname varchar(50), lastname  varchar(50),
age int, course varchar(50)
);

select * from admission_date;


insert into admission_date(student_matric_no, firstname, lastname,
age, course)
values
("090032", "opemipo", "akinola", "23", "Chemical Engineer"),
("090021", "Abraham", "Ige", "19", "Data Analysis"),
("090022", "Ifeoluwa", "Taiwo", "21", "Product Design");

select firstname from admission_date;

select student_matric_no from admission_date;

select age from admission_date;

select course from admission_date;

select firstname, course from admission_date;