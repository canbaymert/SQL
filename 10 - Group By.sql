/*============================= GROUP BY =====================================
    GROUP BY finds data with the same values and simply combines them.
    
    GROUP BY is usually used with aggregate functions like AVG(),COUNT(),MAX(),MIN() and SUM() 
    
    SYNTAX:
    SELECT column_name(s)
	FROM table_name
	WHERE condition
	GROUP BY column_name(s)
	ORDER BY column_name(s);
==============================================================================*/ 
use DB1;
    
CREATE TABLE grocery 
(
	name varchar(50), 
	product_name varchar(50), 
	number_of_products int 
);
    
INSERT INTO grocery VALUES( 'Page', 'Apple', 5);
INSERT INTO grocery VALUES( 'Sybella', 'Banana', 3);
INSERT INTO grocery VALUES( 'Meryl', 'Apple', 2);
INSERT INTO grocery VALUES( 'Sheryl', 'Grapes', 4);
INSERT INTO grocery VALUES( 'Archer', 'Banana', 2);
INSERT INTO grocery VALUES( 'Joline', 'Apple', 3);
INSERT INTO grocery VALUES( 'Randall', 'Grapes', 4);
INSERT INTO grocery VALUES( 'Camille', 'Armut', 2);
INSERT INTO grocery VALUES( 'Gary', 'Apple', 3);
INSERT INTO grocery VALUES( 'Gary', 'Grapes', 4);
INSERT INTO grocery VALUES( 'Page', null, 2);

select * from grocery;
    
    
-- Group products by name    
select name, sum(number_of_products) as total_products
from grocery
group by name;


-- Group products by product_name
select product_name, count(name)
from grocery
where product_name is not null
group by product_name;


-- Group and order by number_of_products
select product_name, min(number_of_products) as min, max(number_of_products) as max
from grocery
where product_name is not null
group by product_name
order by max desc;


select name, product_name, sum(number_of_products) as total_products
from grocery
group by name, product_name
order by name desc;

select name, product_name, sum(number_of_products) as total_products
from grocery
group by name, product_name
having total_products >=3  -- 'where' cannot be used with aggregate functions like (SUM,COUNT, MIN, MAX, AVG). 'having' can be used in these cases.
order by total_products desc;

-- List the products with max number of products
select product_name, max(number_of_products)
from grocery
group by product_name
having max(number_of_products) != min(number_of_products)	-- < > can be used instead of != 
order by max(number_of_products);

/*==================================== DISTINCT ======================================

	DISTINCT , filters the repeating values and creates unique columns
	
	SYNTAX
    -----
    SELECT DISTINCT column_name1, column_name2 ...
    FROM table_name;
======================================================================================= */


select product_name from grocery;
select distinct product_name from grocery;

-- Number of different fruits in grocery
select count(distinct product_name) as unique_fruits from grocery;

-- product_name + name will be unique
select distinct product_name, name from grocery;


create table developers
(id int primary key,
name varchar(20),
surname varchar(20),
age int,
sex char,
city varchar(20),
country varchar(20),
salary int
);

insert into developers values(100, 'Kylie',  'Kimberley', '25', 'M', 'NYC', 'USA', '20000');
insert into developers values(101, 'Elissa', 'Elenora', '35', 'F', 'NYC', 'USA', '25000');
insert into developers values(102, 'Jaron', 'Catherina', '55', 'M', 'NYC', 'USA', '22000');
insert into developers values(103, 'Libby', 'Hardy', '45', 'F', 'Utah', 'USA', '20000');
insert into developers values(104, 'Madelaine', 'Viviette', '28', 'F', 'Minnesota', 'USA', '15000');
insert into developers values(105, 'Marina', 'Travis', '46', 'F', 'Washington', 'USA', '30000');
insert into developers values(106, 'Scottie', 'Alton', '38', 'M', 'New Jersey', 'USA', '28000');
insert into developers values(107, 'Felecia', 'Jessa', '29', 'F', 'Los Angeles', 'USA', '21000');
insert into developers values(108, 'Gift', 'Jacklyn', '49', 'M', 'Munich', 'Germany', '40000');
insert into developers values(109, 'Horace', 'Tabitha', '52', 'M', 'Munich', 'Germany', '45000');
insert into developers values(110, 'Sydney', 'Callahan', '33', 'F', 'Berlin', 'Germany', '35000');
insert into developers values(111, 'Beau', 'Gideon', '44', 'F', 'Paris', 'France', '34000');
insert into developers values(112, 'Alys', 'Audley', '28', 'F', 'NYC', 'USA', '29000');
insert into developers values(113, 'Cordelia', 'Melvyn', '45', 'F', 'Chicago', 'USA', '19000');
insert into developers values(114, 'Quintin', 'Inez', '55', 'M', 'NYC', 'USA', '25000');
insert into developers values(115, 'Carley', 'Wilmer', '36', 'M', 'London', 'England', '50000');
insert into developers values(116, 'Brad', 'Paulette', '29', 'M', 'London', 'England', '55000');
insert into developers values(117, 'Phyllis', 'Addie', '47', 'M', 'Berlin', 'Germany', '42000');
insert into developers values(118, 'Judie', 'Brittney', '37', 'F', 'Paris', 'France', '41000');
insert into developers values(119, 'Darrell', 'Clematis', '32', 'M', 'Roma', 'Italy', '39000');

select * from developers;

-- List the countries of the developers
select country from developers group by country;

-- List the average developer salaries of different countries
select country, round(avg(salary), 2) as average_salary
from developers
group by country;

-- List the number of developers in each country
select country, count(name) as number_of_developers
from developers
group by country;


-- List the average salary of men and women
select sex, round(avg(salary)) as average_salary
from developers
group by sex;


-- Group personel by countries and cities
select country, city from developers group by country, city;


-- List the number of developers in different cities
select country, city, count(*) as number_of_developers
from developers
group by country, city;


-- Group developers by country and sex and calculate the average age
select country, sex, count(*) as number_of_developers, round(avg(age)) as average_age
from developers
group by country, sex;


-- Group developers whose salary is greater than 30000 by country and sex and calculate the average age (Order by average age)
select country, sex, count(*) as number_of_developers, round(avg(age)) as average_age
from developers
where salary > 30000
group by country, sex
order by average_age desc;

