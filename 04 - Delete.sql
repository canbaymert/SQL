-- DATA TYPE - CHAR AND VARCHAR
/*
char(size):		Stores characters with a constant size
				size -> can be between 0 and 255 char(11), char(255)
				char -> default is 1

varchar(size):	Stores characters with different sizes
				size -> can be between 0 and 65535  varchar(125), varchar(9500)

https://dev.mysql.com/doc/refman/8.0/en/char.html

*/


/* ============================== DELETE ===================================  

DELETE FROM table_name; deletes all data in the table
DELETE FROM table_name WHERE column_name = c1; 	deletes a column in the table

*/

use DB1;
create table students
(
id int PRIMARY KEY,
name varchar(40),
country varchar(100),
exam_score int
);

insert into students values('120', 'Eva Shelby', 'England', '75');
insert into students values('121', 'Petrina Maurice', 'France', '85');
insert into students values('122', 'Bee Skye', 'Japan', '65');
insert into students values('123', 'Rian Ripley', 'France', '95');
insert into students values('124', 'Elissa Olivia', 'USA', '80');

select * from students;


    

delete from students where id=124;
delete from students where name= 'Petrina Maurice';
delete from students where name = 'Elissa Olivia' or name = 'Rian Ripley';
delete from students WHERE name in('Bee Skye', 'Rian Ripley');
delete from students where name = 'Elissa Olivia | Rian Ripley';      
delete from students where isim='Eva Shelby' and id=120;
delete from students where id>126;
delete from students where id in(123,125,126);
delete from students where id=123 or id= 125 or id=126;
    

select * from students;

    
delete from students; -- deletes all data in the table

truncate table students; -- deletes all data in the table, where command cannot be used

drop table students;  -- deletes the table
   


create table students2
(
id int PRIMARY KEY,
name varchar(40),
country varchar(100),
exam_score int
);

insert into students values('120', 'Eva Shelby', 'England', '75');
insert into students values('121', 'Petrina Maurice', 'France', '85');
insert into students values('122', 'Bee Skye', 'Japan', '65');
insert into students values('123', 'Rian Ripley', 'France', '95');
insert into students values('124', 'Elissa Olivia', 'USA', '80');

savepoint abc; -- creates a save point

select * from students;

delete from students;

rollback to abc; -- returns the data at the save point

drop table students; -- savepoint is also deleted
    