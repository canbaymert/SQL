/*=============================== ALTER TABLE =========================================
    
    ALTER TABLE is used to ADD, MODIFY, veya DROP/DELETE COLUMNS processes
    ALTER TABLE can be used to (RENAME) tables
    
    constraint check ->  limits the data entrance for a column
=======================================================================================*/

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
INSERT INTO staff VALUES(345678901, 'Joseph Lila', 'Berlin', 3500, 'Honda'); 
INSERT INTO staff VALUES(456789012, 'Iola Sheryll', 'Izmir', 6000, 'Ford');
INSERT INTO staff VALUES(567890123, 'Lonny Shon', 'Londra', 7000, 'Fiat');
INSERT INTO staff VALUES(456715012, 'Ashlea Vicki', 'Dublin', 4500, 'Ford');
    
select * from staff;
   
alter table staff add country varchar(20) default 'USA'; -- adds a new column named country with a default value USA
alter table staff add sex char; -- adds a new column named sex 
alter table staff drop column sex; 


alter table staff add column (birth_place varchar (20), age int); -- adds two new columns named birth_place and age
select * from staff;


alter table staff drop column birth_place; -- removes the given column from table
alter table staff drop column age; -- removes the given column from table
alter table staff drop column company; -- removes the given column from table


alter table staff rename column country to country_name; -- renames the column
select * from staff;

alter table staff rename to staff2; -- renames the table
select * from staff2;


alter table staff2 modify country_name varchar(30) not null; -- Changes data type of the country name column and adds not null constraint

alter table staff2 add constraint check (salary>=3000); -- Given salary value cannot be lower than 3000

