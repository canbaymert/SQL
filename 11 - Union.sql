/*======================== SET OPERATORS: UNION, UNION ALL==========================
    
    UNION, UNION ALL: These SET operators merge results of the 2 or more queries and returns one result. 

    P.S.: Data types should be appropriate.
    
    SYNTAX:
    ----------
    SELECT column_name1,column_name2, .. FROM table1
    UNION
    SELECT column_name1,column_name2, .. FROM table2
    
    NOT: UNION operator takes UNIQUE values. UNION ALL takes NON-UNIQUE values too.
======================================================================================*/ 

use DB1;
CREATE TABLE staff
(
id int PRIMARY KEY, 
name VARCHAR(50), 
city VARCHAR(50), 
salary int, 
company VARCHAR(20)
);


INSERT INTO staff VALUES(123456789, 'Delroy Paula', 'New York', 5500, 'Honda');
INSERT INTO staff VALUES(234567890, 'Michaela Nigellus', 'Sydney', 4500, 'Toyota');
INSERT INTO staff VALUES(345678901, 'Joseph Lila', 'New York', 3500, 'Honda'); 
INSERT INTO staff VALUES(345678902, 'Joseph Lila', 'Nurnberg', 3500, 'Honda'); 
INSERT INTO staff VALUES(456789012, 'Joseph Lila', 'Berlin', 6000, 'Ford');
INSERT INTO staff VALUES(567890123, 'Lonny Shon', 'New York', 7000, 'Fiat');
INSERT INTO staff VALUES(456715012, 'Ashlea Vicki', 'Dublin', 4500, 'Ford');
INSERT INTO staff VALUES(456715013, 'Blue Kester', 'Amsterdam', 4200, 'Honda');

    
select * from staff;


select name as name_and_city, salary from staff where salary>4000
union
select city, salary from staff where salary>5000;


select salary, name as name_and_city from staff where name = 'Joseph Lila'
union
select salary, city from staff where city ='New York' order by salary desc;


-- List the personnel who works at 'Honda' and 'Ford'
select name, company from staff where company='Honda'
union
select name, company from staff where company='Ford'
union
select name, company from staff where company='Fiat';

-- 2nd way
select name, company from staff where company in ('Honda','Ford', 'Fiat');



-- List the people with salary<5000 + the people not working for 'Honda'
select name, salary, company from staff where salary<5000
union
select name, salary, company from staff where company != 'Honda';




-- List the people with name:'Joseph Lila' + the people not from 'New York'
select name, city from staff where name = 'Joseph Lila'
union
select name, city from staff WHERE city != 'New York'; 


/*======================== UNION OF DIFFERENT TABLES ====================*/   
    
CREATE TABLE staff_info 
(
	id int, 
	phone_number char(10) UNIQUE , 
	number_of_children int
); 
   
INSERT INTO staff_info VALUES(123, '5302345678' , 5);
INSERT INTO staff_info VALUES(234, '5422345678', 4);
INSERT INTO staff_info VALUES(345, '5354561245', 3); 
INSERT INTO staff_info VALUES(478, '5411452659', 3);
INSERT INTO staff_info VALUES(789, '5551253698', 2);
INSERT INTO staff_info VALUES(344, '5524578574', 2);
INSERT INTO staff_info VALUES(125, '5537488585', 1);

select * from staff_info;

 
select city as city_and_phone_number , salary as salary_and_number_of_children from staff where id = 123456789
union
select phone_number, number_of_children from staff_info where id = 123;



select id from staff where city in('Sydney', 'Berlin')
union
select id from staff_info where number_of_children in (2, 3);




