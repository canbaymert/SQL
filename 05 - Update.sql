-- UPDATE - SET  

use DB1;

CREATE TABLE suppliers -- parent
(
tax_id int PRIMARY KEY,
company_name VARCHAR(50),
contact_name VARCHAR(50)
);
    
INSERT INTO suppliers VALUES (101, 'IBM', 'Bernard Haseeb');
INSERT INTO suppliers VALUES (102, 'Huawei', 'Serafina Vinh');
INSERT INTO suppliers VALUES (103, 'Erikson', 'Ren Damian');
INSERT INTO suppliers VALUES (104, 'Apple', 'Philandros Dajana');

select * from suppliers;
    
CREATE TABLE products -- child
(
tax_id int, 
product_id int, 
product_name VARCHAR(50), 
customer_name VARCHAR(50),
CONSTRAINT fk_tax_id FOREIGN KEY(tax_id) REFERENCES suppliers(tax_id)
on delete cascade
);    
    
INSERT INTO products VALUES(101, 1001,'Laptop', 'Du Reshma');
INSERT INTO products VALUES(102, 1002,'Phone', 'Gunder Vinzenz');
INSERT INTO products VALUES(102, 1003,'TV', 'Dinesha Jorah');
INSERT INTO products VALUES(102, 1004,'Laptop', 'Iago Fedelmid');
INSERT INTO products VALUES(103, 1005,'Phone', 'Iya Storm');
INSERT INTO products VALUES(104, 1006,'TV', 'Anaiah Klaus');
INSERT INTO products VALUES(104, 1007,'Phone', 'Dawa Valerija');
    
SELECT * FROM products;

SELECT * from suppliers, products where suppliers.tax_id = products.tax_id;



-- Q01 Update the company name of the supplier with tax id=102 as 'Samsung'
update suppliers set company_name = 'Samsung' where tax_id= '102';
select * from suppliers;


-- Q02 Update all company names as Xiaomi on the suppliers table
update suppliers set company_name = 'Xiaomi';


-- Q03 Update the company name of the supplier with tax id=101 as 'Bosch' and contact name as Ashlea Rajesh
update suppliers set company_name = 'Bosch' where tax_id = 101;
update suppliers set contact_name = 'Ashlea Rajesh' where tax_id = 101;
-- Shorter way
update suppliers set company_name = 'Bosch', contact_name = 'Ashlea Rajesh' where tax_id = 101;
select * from suppliers;
 
 
-- Q04 Update the contact name of the supplier with company_name=Apple as 'Tim Cook'
update suppliers set contact_name = 'Tim Cook' where company_name = 'Apple';


-- Q05 Update the product_name 'Phone' as 'Mobile' on the products table
update products set product_name = 'Phone' where product_name = 'Mobile';
SELECT * FROM products;

-- Q06 Increase the product_id of products that have product id greater that 1004 by 1 
update products set product_id = product_id+1 where product_id>1004;

-- Q07 Increase the product_id of products by tax_id
update products set product_id = product_id + tax_id;


-- Q08 Update the product_name of customer Du Reshma as company_name of Bernard Haseeb from suppliers

update products set product_name = (select company_name from suppliers where contact_name='Bernard Haseeb') 
where customer_name = 'Du Reshma';

SELECT * FROM products;


 -- Q09 Replace the name of laptop product customers with supplier contact_name of Apple

 update products set customer_name = (select contact_name from suppliers where company_name ='Apple')
 where product_name='Laptop';
 
SELECT * from suppliers, products where suppliers.tax_id = products.tax_id;
drop table products, suppliers;
