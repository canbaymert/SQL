/*========================================= JOIN İSLEMLERİ ===================================================
    Join operators can be used to combine columns of different tables to create a new table.
    
    1) INNER JOIN: Returns the common results of both tables
    2) LEFT JOIN:  Returns all results of first table
    3) RIGHT JOIN: Returns all results of second table
       FULL JOIN: (left join + union  + right join) Returns all results
===================================================================================================================*/   


use DB1;

create table QAlectures
(lecture_id int,
lecture_name varchar(30),
lecture_hours varchar(30)
);

insert into QAlectures values (101, 'Java', 40);
insert into QAlectures values (102, 'Selenium', 30);
insert into QAlectures values (103, 'API', 15);
insert into QAlectures values (104, 'SQL', 10);
insert into QAlectures values (105, 'SDLC', 10);
insert into QAlectures values (106, 'Jenkins', 12);


create table DEVlectures
(lecture_id int,
lecture_name varchar(30),
lecture_hours varchar(30)
);

insert into DEVlectures values (101, 'Java', 40);
insert into DEVlectures values (103, 'API', 15);
insert into DEVlectures values (104, 'SQL', 10);
insert into DEVlectures values (105, 'SDLC', 10);
insert into DEVlectures values (106, 'Jenkins', 12);
insert into DEVlectures values (107, 'Python', 20);
insert into DEVlectures values (108, 'Micro Services', 12);

select * from QAlectures;

select * from DEVlectures;


-- common lectures

select QAlectures.lecture_id, QAlectures.lecture_name, QAlectures.lecture_hours
from QAlectures, DEVlectures
where QAlectures.lecture_id = DEVlectures.lecture_id;


/*=============================== INNER JOIN  ==================================
    
    
    Syntax
    -----------
    SELECT column1,column2...columnN
    FROM table1  
    INNER JOIN table2 
    ON table1.column1 = table2.column2; 
================================================================================ */

-- Inner Join Common Lectures

-- QAlectures = A
-- DEVlectures : B

select A.lecture_id, A.lecture_name, A.lecture_hours 
from QAlectures as A
inner join DEVlectures as B
on A.lecture_id = B.lecture_id;




/*=============================== LEFT JOIN  ==================================

    Syntax
    -----------
   SELECT column1,column2...columnN
    FROM table1
    LEFT JOIN table2
    ON table1.column1 = table2.column2; 
==============================================================================*/  


-- Left Join QALectures

-- QAlectures = A
-- DEVlectures : B

select A.lecture_id, A.lecture_name, A.lecture_hours from QAlectures as A
left join DEVlectures as B
on A.lecture_id = B.lecture_id;	





/*======================================== RIGHT JOIN  =============================================
    
    Syntax
    -----------
	SELECT column1,column2...columnN
    FROM table1 
    RIGHT JOIN table2
    ON table1.column1 = table2.column2; 
====================================================================================================*/ 


-- Right Join DEVLectures

select B.lecture_id, B.lecture_name, B.lecture_hours from QAlectures as A
right join DEVlectures as B
on A.lecture_id = B.lecture_id;	



-- full join
-- left join + union + right join

select A.lecture_id, A.lecture_name, A.lecture_hours from QAlectures as A
left join DEVlectures as B
on A.lecture_id = B.lecture_id
union
select B.lecture_id, B.lecture_name, B.lecture_hours from QAlectures as A
right join DEVlectures as B
on A.lecture_id = B.lecture_id;	






create table films
(film_id int,
film_name varchar(30),
category varchar(30)
);

insert into films values (1, 'Assassins Creed: Embers', 'Animations');
insert into films values (2, 'Real Steel(2012)', 'Animations');
insert into films values (3, 'Alvin and the Chipmunks', 'Animations');
insert into films values (4, 'The Adventures of Tin Tin', 'Animations');
insert into films values (5, 'Safe (2012)', 'Action');
insert into films values (6, 'Safe House(2012)', 'Action');
insert into films values (7, 'Marley and me', 'Romance');


create table actors
(id int,
actor_name varchar(30),
film_id int
);

insert into actors values (1, 'Adam Smith', 1);
insert into actors values (2, 'Ravi Kumar', 2);
insert into actors values (3, 'Susan Davidson', 5);
insert into actors values (4, 'Lee Pong', 6);
insert into actors values (5, 'Bruce Lee', NULL);

select * from films;
select * from actors;



-- List all films, categories, and their actor names
-- 1st way: Left Join
select film_name, category, actor_name
from films as A left join actors as B
on A.film_id = B.film_id;


-- 2nd way: Right Join
select  film_name, category, actor_name
from actors as B right join films as A
on A.film_id = B.film_id;


-- List all actors and their films
-- 1st way: Left Join
select actor_name, film_name
from actors as B left join films as A
on A.film_id = B.film_id;



-- 2nd way: Right Join
select actor_name, film_name
from films as A right join actors as B
on A.film_id = B.film_id;






