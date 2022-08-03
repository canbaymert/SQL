create database SchoolDB;

use SchoolDB;

create table students
(student_no int primary key,
student_name varchar(50),
class varchar(10),
sex char
);

insert into students values(100, 'Leta Karson', 9, 'F');
insert into students values(101, 'Hubert Cecilia', 9, 'M');
insert into students values(102, 'Esmaralda Myra', 9, 'F');
insert into students values(103, 'Darlene Carol', 9, 'F');
insert into students values(104, 'Jaynie Melinda', 9, 'F');
insert into students values(105, 'Jacqueline Walter', 10, 'F');
insert into students values(106, 'Merideth Tanya', 10, 'F');
insert into students values(107, 'Ernest Coty', 10, 'M');
insert into students values(108, 'Elliott Korey', 10, 'M');
insert into students values(109, 'Madison Jonelle', 10, 'M');
insert into students values(110, 'Buffy Kendal', 11, 'M');
insert into students values(111, 'Seward Lonnie', 11, 'M');
insert into students values(112, 'Jeffery Raleigh', 11, 'M');
insert into students values(113, 'Honey Danna', 11, 'F');
insert into students values(114, 'Adamina Kylan', 11, 'F');
insert into students values(115, 'Evangelina Gabriel', 12, 'F');
insert into students values(116, 'Creighton Shepherd', 12, 'M');
insert into students values(117, 'Paden Harleigh', 12, 'M');
insert into students values(118, 'Jordana Caitlyn', 12, 'F');
insert into students values(119, 'Michayla Keri', 12, 'F');
insert into students values(120, 'Maura Tristan', 12, 'F');
select * from students;
commit;
select * from students where sex='M';


create table scores
(
student_no int primary key,
student_name varchar(50),
physics int,
maths int,
chemistry int,
biology int,
CONSTRAINT school_no_fk FOREIGN KEY(student_no) REFERENCES students(student_no)
);
insert into scores values(100, 'Leta Karson', 40, 50, 60, 70);
insert into scores values(101, 'Hubert Cecilia', 45, 55, 65, 75);
insert into scores values(102, 'Esmaralda Myra', 50, 60, 70, 80);
insert into scores values(103, 'Darlene Carol', 55, 65, 75, 85);
insert into scores values(104, 'Jaynie Melinda', 60, 70, 80, 90);
insert into scores values(105, 'Jacqueline Walter', 65, 75, 85, 95);
insert into scores values(106, 'Merideth Tanya', 70, 80, 90, 100);
insert into scores values(107, 'Ernest Coty', 65, 75, 85, 95);
insert into scores values(108, 'Elliott Korey', 60, 70, 80, 90);
insert into scores values(109, 'Madison Jonelle', 55, 65, 75, 85);
insert into scores values(110, 'Buffy Kendal', 50, 60, 70, 80);
insert into scores values(111, 'Seward Lonnie', 45, 55, 65, 75);
insert into scores values(112, 'Jeffery Raleigh', 40, 50, 60, 70);
insert into scores values(113, 'Honey Danna', 45, 55, 65, 75);
insert into scores values(114, 'Adamina Kylan', 50, 60, 70, 80);
insert into scores values(115, 'Evangelina Gabriel', 55, 65, 75, 85);
insert into scores values(116, 'Creighton Shepherd', 60, 70, 80, 90);
insert into scores values(117, 'Paden Harleigh', 65, 75, 85, 95);
insert into scores values(118, 'Jordana Caitlyn', 70, 80, 90, 100);
insert into scores values(119, 'Michayla Keri', 65, 75, 85, 95);
insert into scores values(120, 'Maura Tristan', 35, 55, 45, 75);

select * from scores;

SELECT * FROM students, scores WHERE students.student_no = scores.student_no;


