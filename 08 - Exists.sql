/*=========================== EXISTS, NOT EXIST ================================
   
	EXISTS is a boolean operator and returns true or false
    If subquery returns data, EXIST operator returns true.

    
    SYNTAX:
    SELECT column_name  
	FROM table_name  
	WHERE [NOT] EXISTS (  
    SELECT column_name   
    FROM table_name   
    WHERE condition  
); 
==============================================================================*/

use DB1;

CREATE TABLE march
(
	product_id int,
	customer_name varchar(50), 
	product_name varchar(50)
);
    
CREATE TABLE april 
(
	product_id int ,
	customer_name varchar(50), 
	product_name varchar(50)
);
    
INSERT INTO march VALUES (10, 'Mark', 'Honda');
INSERT INTO march VALUES (20, 'John', 'Toyota');
INSERT INTO march VALUES (30, 'Amy', 'Ford');
INSERT INTO march VALUES (20, 'Mark', 'Toyota');
INSERT INTO march VALUES (10, 'Adam', 'Honda');
INSERT INTO march VALUES (40, 'John', 'Hyundai');
INSERT INTO march VALUES (20, 'Eddie', 'Toyota');
   
INSERT INTO april  VALUES (10, 'Amy', 'Honda');
INSERT INTO april  VALUES (10, 'Brad', 'Honda');
INSERT INTO april  VALUES (20, 'Max', 'Toyota');
INSERT INTO april  VALUES (50, 'Leo', 'Volvo');
INSERT INTO april  VALUES (20, 'Christopher', 'Toyota');
    
select * from march;
select * from april ;
    

-- Q1: List the customer names and product ids from the table of March of the products that is sold with same product_id in March and April  

select product_id, customer_name from march where exists (select product_id from april where march.product_id = april.product_id);

-- 2nd way
select product_id, customer_name from march where product_id in(select product_id from april where march.product_id = april.product_id);


-- Q2: List the customer names and product ids from the table of April of the products that is sold with same product_id in March and April  

select product_id, customer_name
from april
where exists
(select product_id
from march
where april.product_name=march.product_name);


  
-- Q03 List the products that is not sold in both months and customers names who bought it in April

select product_name, customer_name
from april 
where not exists
(select product_name
from march 
where april.product_name = march.product_name);


/*===================== IS NULL, IS NOT NULL, COALESCE ========================
    
    IS NULL and IS NOT NULL are boolean operators that checks the parameters are NULL or NOT
    
    COALESCE is a function that returns the first NOT NULL value between the given parameters. Returns NULL if all values are NULL.
    
    column_name = COALESCE(parameter1, parameter2, .....parameterN)
    
==============================================================================*/

CREATE TABLE people 
(
	ssn CHAR(9), -- Social Security Number
	name VARCHAR(50), 
	city VARCHAR(50) 
);

INSERT INTO people VALUES('123456789', 'Eva Shelby', 'Paris');
INSERT INTO people VALUES('234567890', 'Petrina Maurice', 'New York');
INSERT INTO people VALUES('345678901', 'Oliver Sykes', 'London');
INSERT INTO people (ssn, city) VALUES('456789012', 'Sydney');
INSERT INTO people (ssn, city) VALUES('567890123', 'Rio');
INSERT INTO people (city) VALUES('Tokio');
INSERT INTO people (ssn) VALUES('999111222');
                
select * from people;
drop table people;

select * from people where name is null;
 
select * from people where name is not null;

update people set name = 'NO NAME' WHERE name is null;

select * from people;

update people set name = null  WHERE name = 'NO NAME';

select * from people;


update people set name = coalesce(name, 'NO NAME'),
city = coalesce(city, 'NO CITY'),
ssn = coalesce(ssn, 'NO SSN')
where name is null or city is null or ssn is null;
 
 select * from people;