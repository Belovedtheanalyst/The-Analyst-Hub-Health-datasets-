create database employees_salary;

create table salary (firstname varchar(50),
 lastname varchar(50),
 salary int
);

select * from salary;

insert into salary (firstname , lastname , salary)
values
("John", "Smith", "2000"),
("David", "William", "1500"),
("Chloe", "Anderson", "3000"),
("Emily",  "Adams", "4500"),
("James", "Roberts", "2000"),
("Andrew", "Thomas", "2500"),
("Daniel", "Harris", "3000"),
("Chalortte", "Walker", "3500"),
("Samuel", "Clark", "4000"),
("Anthony", "Young", "5000");

select firstname, lastname, salary+500 from salary;

select firstname, lastname, (salary+500) as new_salary from salary;


select firstname, lastname, (salary+500)
 as new_salary from salary
 order by salary;
 
 select firstname, lastname, (salary+500)
 as new_salary from salary
 order by salary
 limit 4;
 
  select firstname, lastname, (salary+500)
 as new_salary from salary
 order by salary desc
 limit 4;
 
  select firstname, lastname, (salary+500)
 as new_salary from salary
 order by salary desc
 limit 1;
 
 select firstname, lastname, (salary+500)
 as new_salary from salary
 order by salary desc
 limit 4 offset 3;
 
 select * from salary
 order by salary desc
 limit 4 offset 3;
 
 select * from salary;
 
 select firstname, upper(lastname), salary from salary;
 
  select lower(firstname), upper(lastname), salary from salary;
  
   select trim(firstname), upper(lastname), salary from salary;
   
   select trim(firstname), (lastname), salary from salary;
   
   select length(firstname) from salary
   where firstname = "John";
   
select firstname, lastname, salary+500 from salary;





select salary , sqrt(salary+500) from salary;

select salary, sqrt(salary) from salary;

select salary, sqrt(salary) as sqrt_salary from salary;

select salary, sqrt(round (salary)) as sqrt_salary from salary;

select salary, round(sqrt (salary)) as sqrt_salary from salary;

select salary, sqrt(salary), salary+500 , sqrt(salary+500)  from salary;

select salary, sqrt(salary), (salary+500) as new_salary, 
(sqrt(salary+500)) as new_sqrt_salary 
 from salary;

select salary, round(sqrt(salary)) as Salary, (salary+500) as new_salary, 
round((sqrt(salary+500))) as new_sqrt_salary 
 from salary;

select avg(salary) from salary;

select sum(salary) from salary;

select count(*), avg(salary), sum(salary) from salary;

select count(salary), round(avg(salary)), sum(salary) from salary;

select count(salary), round(avg(salary+500)) as Avg_salary,
sum(salary+500) as Total_salary from salary;


select salary , salary+500 as new_salary, sqrt(salary+500) as sqrt from salary;

select salary from salary;

select sum(salary), avg(salary) from salary;

select avg(salary) from salary;


select count(*), sum(salary), avg(salary) from salary;

select min(salary), max(salary), sum(salary), avg(salary) from salary;

select salary+500 from salary;


select sum(salary+500) from salary;

select avg(salary+500) from salary;

select min(salary+500), max(salary+500), sum(salary+500), avg(salary+500) from salary;

select upper(firstname), lastname from salary;

select upper(firstname), lower(lastname) from salary;

select firstname, length(firstname) as Count_len, lower(lastname) from salary;



##SUBQUERY

select firstname, salary from salary
where salary > 3100;

select firstname, salary from salary
where salary > 3100
order by salary desc;

select avg(salary) from salary;

select firstname, salary from salary
where salary > (select avg(salary) from salary)
;

select firstname, salary from salary
where salary > (select avg(salary) from salary)
order by salary desc;

select avg(salary+500) from salary;

select firstname, (salary+500) as New_salary from salary
where salary > 
(select avg(salary+500) as Avg_salary from salary)
order by salary desc;

select (salary+500) as New_salary from salary
where salary > 
(select avg(salary+500) as Avg_salary from salary)
order by salary desc;


##Like pattern

Select firstname from salary
where firstname Like "A%";

select firstname, (salary+500) as New_salary from salary
where salary > 3600
order by salary desc;

##Like pattern

Select firstname from salary
where firstname Like "%A";

Select firstname from salary
where firstname Like "A%";

Select firstname from salary
where firstname Like "c%";

Select firstname from salary
where firstname Like "%y";

Select firstname, salary from salary
where firstname Like "%y";

Select lastname, salary from salary
where lastname Like "%r";

Select lastname, salary from salary
where lastname Like "r%";

select * from salary 
where lastname like "%s";

select * from salary 
where lastname like "%s"
order by salary;

select * from salary 
where lastname like "%s"
order by salary desc;


select * from salary;

select min(salary) from salary;

select max(salary) from salary;

select min(salary), max(salary) from salary;

select count(*), min(salary), max(salary), 
avg(salary), 
sum(salary) from salary;

select salary+500 from salary;

select salary-500 from salary;

select salary*500 from salary;

select salary/500 from salary;
