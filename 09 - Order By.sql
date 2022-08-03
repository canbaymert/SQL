/*================================ ORDER BY  ===================================   
   Syntax
   -------
	ORDER BY column_name ASC (ASCENDING)   
	ORDER BY column_name DESC (DESCENDING) 
==============================================================================*/       
use DB1;

CREATE TABLE teachers 
(
id int PRIMARY KEY,
ssn CHAR(9) ,
name VARCHAR(50), 
surname VARCHAR(50), 
salary int,
city VARCHAR(50) 
);
    
INSERT INTO teachers VALUES(1, 123456789, 'Rowanne','Elmo', 3000,'London');
INSERT INTO teachers VALUES(2, 234567890, 'Racheal','Chanel', 2890,'Berlin');
INSERT INTO teachers VALUES(3, 345678901, 'Janelle','Jasmin',4200,'Rio');
INSERT INTO teachers VALUES(4, 256789012, 'Lacie','Kaylani',3150,'Moscow');
INSERT INTO teachers VALUES (5, 344678901, 'Alf','Delilah', 5000,'Berlin');
INSERT INTO teachers VALUES (6, 345458901, 'Bertrand','Joslyn',7000,'London');
INSERT INTO teachers VALUES(7, 113456789, 'Dorine','Raymond', 3500,'Amsterdam');
INSERT INTO teachers VALUES(8, 224567890, 'Lucinda','Harrison', 4890,'Sydney');
INSERT INTO teachers VALUES(9, 335678901, 'Stirling','Ibbie',5200,'Prague');
INSERT INTO teachers VALUES(10, 446789012, 'Lanford','Raymond', 4150,'London');
INSERT INTO teachers VALUES (11, 554678901, 'Dorine','Lauren', 8000,'Berlin');
INSERT INTO teachers VALUES (12, 665458901, 'Breann','Lizette',8000,'London');

select * from teachers;
drop table teachers;
    

select * from teachers order by city; 

-- select * from teachers order by city asc; (Ascending is default)

select * from teachers order by adres desc;
select * from teachers order by salary desc;


select * from teachers where name = 'Dorine' order by salary desc;

select * from teachers where surname = 'Raymond' order by salary;


-- ***************************** LİMİT **********************************

select * from teachers;

select * from teachers limit 10;
select * from teachers where id<11;


-- List 11th and 12th values
select * from teachers where id>10;
select * from teachers limit 10,12;
select * from teachers limit 10,2;
select * from teachers where id>10 and id<=12;


select * from teachers order by salary desc;
select * from teachers order by salary desc limit 3;

/* Oracle SQL
select * from teachers order by salary desc
fetch next 3 rows only;
*/


-- List the records with highest 4th, 5th and 6th salaries
select * from teachers order by salary desc limit 3,3;


/* Oracle SQL Çözümü
select * from teachers order by salary desc
OFFSET 3 ROWS			
FETCH NEXT 3 ROWS ONLY;	
*/


-- List the records with highest 7th, 8th and 9th salaries
select * from teachers order by salary desc limit 6,3;

