
	CREATE TABLE departments (
      department_id   int PRIMARY KEY,
      department_name VARCHAR(14),
      location      VARCHAR(13)
    );
    
    INSERT INTO departments VALUES (10,'ACCOUNTING','PARIS');
    INSERT INTO departments VALUES (20,'IT','NEW YORK');
    INSERT INTO departments VALUES (30,'SALES','LONDON');
    INSERT INTO departments VALUES (40,'FINANCE','AMSTERDAM');
    INSERT INTO departments VALUES (50,'HR', 'PRAGUE');
    
    select * from departments;

    CREATE TABLE managers (
      manager_id   int PRIMARY KEY,
      manager_name VARCHAR(10),
      profession        VARCHAR(20),
	  ssn_id 		int,
      salary          int,
      department_id      int
    );

  
    
  
    INSERT INTO managers VALUES (7369,'Rowanne','Sales Manager',1111,800,30);
    INSERT INTO managers VALUES (7499,'Racheal','Finance Manager',1222,1600,40);
    INSERT INTO managers VALUES (7521,'Janelle','Finance Manager',1222,1250,40);
    INSERT INTO managers VALUES (1111,'Lacie','Accounting Manager',7839,2975,10);
    INSERT INTO managers VALUES (7654,'Alf','Finance Manager',1222,1250,40);
    INSERT INTO managers VALUES (1222,'Bertrand','Accounting Manager',7839,2850,10);
    INSERT INTO managers VALUES (1333,'Dorine','Accounting Manager',7839, 2450,10);
    INSERT INTO managers VALUES (7788,'Lucinda','Business Analyst',1111,3000,20);
    INSERT INTO managers VALUES (7839,'Stirling','IT Manager',NULL,5000,20);
    INSERT INTO managers VALUES (7844,'Lanford','Finance Manager',1222,1500,40);
    INSERT INTO managers VALUES (7876,'Dorine','Sales Manager',1111,1100,30);
    INSERT INTO managers VALUES (7900,'Breann','Sales Manager',1222,950,30);
    INSERT INTO managers VALUES (7902,'John','HR Manager',1111,3000,50);
    INSERT INTO managers VALUES (7934,'Brian','Sales Manager',1333,1300,30);
    INSERT INTO managers VALUES (7956,'Brad','HR Manager',1333,3300,50);
    INSERT INTO managers VALUES (7933,'Leonardo','IT Manager',1333,4300,20);
    
   SELECT * FROM managers;
 

-- List of Accounting and Sales Managers and their department names

-- 1st way
select manager_name, department_name
from departments as D LEFT join managers as M
on D.department_id = M.department_id
where department_name in('SALES', 'ACCOUNTING')
order by D.department_name, M.manager_name;

-- 2nd way
select manager_name, department_name
from managers as M right join departments as D
on D.department_id = M.department_id
where department_name in('SALES', 'ACCOUNTING')
order by D.department_name, M.manager_name;


-- List of FINANCE, HR and SALES managers and their department names

-- 1st way
select manager_name, department_name
from departments as D left join managers as M
on D.department_id = M.department_id
where D.department_id in('30', '40','50')
order by D.department_name;


-- 2nd way
select manager_name, department_name
from managers as M right join departments as D
on D.department_id = M.department_id
where D.department_id in('30', '40','50')
order by D.department_name;



-- List of all managers, their department names and their salaries

-- 1st way
select manager_name, department_name, salary
from departments as D left join managers as M
on D.department_id = M.department_id
order by D.department_name desc, M.salary;

-- 2nd way
select manager_name, department_name, salary
from managers as M right join departments as D
on D.department_id = M.department_id
order by D.department_name desc, M.salary;


-- List of managers who have a greater salary then 2000 and from SALES and ACCOUNTING department  
select manager_name, department_name, salary
from departments as D left join managers as M
on D.department_id = M.department_id
where D.department_name in ('SALES', 'ACCOUNTING') and salary>2000;



