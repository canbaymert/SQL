create database DB1;
-- create database: create a new database

use DB1;

/*
use: choose the active database
*/

-- create table: create a table in the chosen database

create table people
(
id varchar(4),
name varchar(30),
age int
);

-- Data entry

insert into people values('1000', 'Eva Shelby', 25);
insert into people values('1001', 'Petrina Maurice', 25);
insert into people values('1002', 'Bee Skye', 25);
insert into people values('1003', 'Rian Ripley', 25);
insert into people values('1004', 'Elissa Olivia', 25);

select * from people;
-- brings everything from students tabel

select name from people;
-- brings name column from students table

select id from people;
-- brings id column from students table

select id, name from people;
-- brings name and id column from students table

drop table people;

create table students
(
id int,
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

-- SELECT - WHERE

-- Q01: List the students with an exam score greater than 80
select * from students2 where exam_score>80;

-- Q02: List the students from France
select * from students2 where country='France';

-- Q03: Show the info about student with id=124
select * from students2 where id = 124;

-- Q04: Show the country and exam score of student with id=121
select country, exam_score from students2 where id=121;


create table personnel
(
id char(4),
name varchar(40),
salary int
);

insert into personnel values('1001', 'Blythe Sheena', '70000');
insert into personnel values('1002', 'Richard Carey','85000');
insert into personnel values('1003', 'Ronda Patrick', '65000');
insert into personnel values('1004', 'Richardine Annora', '95000');
insert into personnel values('1005', 'Naomi Rosemary', '80000');
insert into personnel values('1006', 'Noble Benjy', '100000');

select * from personnel;


/*
Usage of 'and' and 'or'
*/

SELECT * FROM students2 where exam_score> 50 AND country = 'France';

SELECT * FROM students2 where exam_score < 50 OR country = 'France';


/*
Usage of 'between'
*/

select * from personnel where id between 1002 and 1005;
select * from personnel where id>=1002 and id<=1005;

select * from personnel where name between 'Ronda Patrick' and 'Naomi Rosemary';


-- Q05: List the personnel with id = '1001', '1002' and '1004'
select * from personnel where id ='1001' or id='1002' or id='1004';
select * from personnel where id in(1001,1002,1004);

/*
Usage of 'in'
*/

-- Q06 List the personnel with salary between 70000 and 100000
select * from personnel where salary in(70000, 100000);
