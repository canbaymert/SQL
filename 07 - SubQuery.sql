--  ============================= SUBQUERIES ====================================

use DB1;

CREATE TABLE workers
(
id int PRIMARY KEY, 
name VARCHAR(50), 
city VARCHAR(50), 
salary int, 
company VARCHAR(20)
);

INSERT INTO workers VALUES(123456789, 'Delroy Paula', 'New York', 5500, 'Vakko');
INSERT INTO workers VALUES(234567890, 'Michaela Nigellus', 'Sydney', 4500, 'Gucci');
INSERT INTO workers VALUES(345678901, 'Joseph Lila', 'Berlin', 3500, 'Adidas'); 
INSERT INTO workers VALUES(456789012, 'Iola Sheryll', 'Izmir', 6000, 'Nike');
INSERT INTO workers VALUES(567890123, 'Lonny Shon', 'Londra', 7000, 'Puma');
INSERT INTO workers VALUES(456715012, 'Ashlea Vicki', 'Berlin', 4500, 'Prada');
INSERT INTO workers VALUES(456715042, 'James Kennedy', 'Los Angeles', 4500, 'Prada');
    
select * from workers;
drop table workers;

CREATE TABLE brands
(
brand_id int, 
brand_name VARCHAR(20), 
number_of_workers int
);
    
INSERT INTO brands VALUES(100, 'Vakko', 12000);
INSERT INTO brands VALUES(101, 'Nike', 18000);
INSERT INTO brands VALUES(102, 'Adidas', 10000);
INSERT INTO brands VALUES(103, 'Prada', 21000);
    
select * from workers;
select * from brands;
    
-- Q01: List the brands who have more than 15000 workers, name and salaries of the workers who works for these brands

select name, salary, company from workers where company in(select brand_name from brands where number_of_workers>15000);
-- 2nd way
select isim, maas, isyeri from calisanlar where isyeri in ('Prada','Nike'); 


-- Q02: List the name, salary and city of the workers whose brand_id is greater than 101

select brand_name from brands where brand_id > 101;
select name,salary, city from workers where company in (select brand_name from brands where brand_id > 101);

-- 2nd way
select name, salary, city from workers where company in ('Adidas', 'Prada');


-- Q3: List the brand id and number of workers of the brands who are from 'Berlin'
select brand_id, number_of_workers from brands
where brand_name in(select company from workers where city = 'Berlin');

-- 2nd way
select brand_id, number_of_workers from brands where brand_name in('Adidas', 'Prada');



  
/* ===================== AGGREGATE METOT KULLANIMI ===========================
    Aggregate Metotlari (SUM,COUNT, MIN, MAX, AVG) Subquery içinde kullanilabilir.
    Ancak, Sorgu tek bir değer döndürüyor olmalidir.
    SYNTAX: sum() şeklinde olmalı sum ile () arasında boşluk olmammalı
==============================================================================*/   
      
-- Q04 List the names of the all brands, number of workers and total salary of the workers who work for that brand

-- select brand_name, number_of_workers, (X) from brands;
-- (X) = (select sum(salary) from workers where brand_name = company)

select brand_name, number_of_workers, (select sum(salary) from workers where brand_name = company) as total_salary from brands;


 
-- Q05 List the names of the all brands, number of workers and average salary of the workers who work for that brand

-- SELECT brand_name, number_of_workers (X) FROM brands;
-- (X): (select round(avg(salary)) from workers where brand_name = company) 

SELECT brand_name, number_of_workers, (select round(avg(salary)) from workers where brand_name = company) as avg_salary FROM brands;

-- round(): rounds the fractions up or down 

SELECT brand_name, number_of_workers, (select round(avg(salary),2) from workers where brand_name = company) as avg_salary FROM brands;

-- round(avg(salary),2): 2 steps of fraction (example:13000,50)

-- Q06 List the names of the all brands, number of workers and max-min salaries of the workers who work for that brand

-- select brand_name, number_of_workers, (X) from brands; 

select brand_name, number_of_workers, (select max(salary) from workers where brand_name = company) as max_salary from brands;

select brand_name, number_of_workers, (select min(salary) from workers where brand_name = company) as min_salary from brands;

-- List the max and the min together

-- select brand_name, number_of_workers, (X), (Y) from brands; 
select brand_name, number_of_workers, 
(select max(salary) from workers where brand_name = company) as max_salary, 
(select min(salary) from workers where brand_name = company) as min_salary 
from brands;


-- Q7: List the name, id and number of headquarters in different cities of the all brands 
-- SELECT brand_id, brand_name, (X) FROM brands;

SELECT brand_id, brand_name, (select count(city) from workers where brand_name = company) as number_of_HQs FROM brands;



