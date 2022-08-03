-- ================================== CONSTRAINTS ==========================================
/*           
    NOT NULL	- Ensures that a column doesn't include a 'NULL' value
    UNIQUE		- Ensures that all values of a column are 'UNIQUE'
    PRIMARY KEY	- (NOT NULL and UNIQUE)
    FOREIGN KEY	- Used to referance Primary Key of another table
                  Establish the connection between tables
                  
-- ========================================================================================*/
use DB1;
 
CREATE TABLE employees
(
id CHAR(5) PRIMARY KEY, -- not null + unique
name VARCHAR(50) UNIQUE,
salary int NOT NULL,
date_of_recruitment DATE
);

INSERT INTO employees VALUES('10002', 'Noble Benjy' ,12000, '2018-04-14');
INSERT INTO employees VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO employees VALUES('10010', null, 5000, '2018-04-14');
INSERT INTO employees VALUES('10020', null, 5000, '2018-04-14'); -- MORE THAN ONE NULL STILL UNIQUE
INSERT INTO employees VALUES('10004', 'Valarie Tahnee', 5000, '2018-04-14');
INSERT INTO employees VALUES('10005', 'Larrie Vinal', 5000, '2018-04-14');
INSERT INTO employees VALUES('10006', 'Lawson Jennica', NULL, '2019-04-12'); -- SALARY CANNOT BE NULL
INSERT INTO employees VALUES('10003', 'Toni Keeleigh', 5000, '2018-04-14');
INSERT INTO employees VALUES('10007', 'Indigo Adelle', 5000, '2018-04-14');
INSERT INTO employees VALUES('10009', 'Indigo Adelle', '5000', '2018-04-14'); -- NAME SHOULD BE UNIQUE
INSERT INTO employees VALUES('10023', 'Satchel Clarette', '', '2018-04-14'); -- SALARY SHOULD BE INT
INSERT INTO employees VALUES('', 'Alesha Shania', 2000, '2018-04-14');
INSERT INTO employees VALUES('', 'Kaelea Lela', 2000, '2018-04-14'); -- PK SHOULD BE UNIQUE
INSERT INTO employees VALUES('', 'Brant Alysia', 6000, '2018-04-14'); -- PK SHOULD BE UNIQUE
INSERT INTO employees VALUES( '10002', 'Cearra Beth' ,12000, '2018-04-14'); -- PK SHOULD BE UNIQUE
INSERT INTO employees VALUES( null, 'Quentin Adela' ,12000, '2018-04-14'); -- PK CANNOT BE NULL
     
select * from employees;
     

CREATE TABLE addresses
(
address_id CHAR(5),    
postal_code int,
street VARCHAR(30),
city VARCHAR(15),
CONSTRAINT id_employees_fk FOREIGN KEY(address_id) REFERENCES employees(id)
-- address_id variable of the addresses table and id variable of the employees table are connected to each other with id_employees foreign key.
);
   
INSERT INTO addresses VALUES('10002','56435','3616 Street','Minnesota');
INSERT INTO addresses VALUES('10008','49107','14120 State Street','Ohio');
INSERT INTO addresses VALUES('10010','31089','232 Dixon Grove Street','Utah');

select * from addresses;

INSERT INTO addresses VALUES('10012','98563', '99 Evergreen Street','Washington'); -- Cannot be inserted because ID is missing in the parents table
INSERT INTO addresses VALUES(NULL,'08022', '13 Cloverdale Way','New Jersey');  -- FK can be null


select * from addresses;
select * from employees;


SELECT * FROM employees, addresses WHERE employees.id = addresses.address_id;


drop table employees; -- Parent table cannot be dropped before child table 
drop table addresses;


delete from employees where id = 10002; -- id cannot be deleted before address_id
delete from addresses where address_id= 10002;
         

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


CREATE TABLE exams
( student_id int,
lecture varchar(30),
exam_score int,
CONSTRAINT student_id_fk FOREIGN KEY (student_id) REFERENCES students(id)
on delete cascade); -- Data in the parent table can be deleted before data child table but both of them will be deleted in that case.
   

INSERT INTO exams VALUES ('120','chemistry',75);
INSERT INTO exams VALUES ('121', 'physics',65);
INSERT INTO exams VALUES ('122', 'history',90);
INSERT INTO exams VALUES ('123', 'maths',90);
INSERT INTO exams VALUES ('124', 'literature',60);
select * from exams;
   
   
SELECT * FROM students, exams WHERE students.id = exams.student_id;
   
delete from exams where student_id='123'; -- Data in the child table is deleted
     
delete from students where id='126'; -- Data in the parent and child tables are deleted

select * from students;
select * from exams;

drop table students;
drop table exams;
