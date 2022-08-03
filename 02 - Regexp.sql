use DB1;

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
SELECT - LIKE : patterns can be used with after like command

PATTERN 
% -> means 0 or more character
_ -> means just one character
*/

-- Q07 List the personnel whose name starts with B
select * from personnel where name like 'B%';

-- Q08 List the personnel whose name ends with Y
select * from personnel where name like '%Y';

-- Q09: List the personnel whose name's second letter is 'I'
select * from personnel where name like '_I%';

-- Q10: List the personnel whose name's second letter is 'I' and has letter 'Y' in their name
select * from personnel where name like '_I%Y%';

-- Q11: List the personnel who has no 'A' letter in their name
select * from personnel where name not like '%A%';

-- Q12: List the personnel who has 'A' letter in their name
select * from personnel where name like '%A%';


-- Q13 List the personnel who has a salary with six digits 
select * from personnel where salary like '______';


-- Q14 List the personnel whose name's first letter is 'R' and 7th letter is 'P'
select * from personnel where name like 'R_____P%';


/* ====================== SELECT - REGEXP_LIKE ================================
     -- 'c' => case-sentisitive 
     -- 'i' => incase-sentisitive 
    --------
    REGEXP_LIKE(column_name, 'pattern[] ', 'c' ] )
           
/* ========================================================================== */

use batch59;

CREATE TABLE words
(
id int UNIQUE,
word VARCHAR(50) NOT NULL,
number_of_letters int
);
   
    INSERT INTO words VALUES (1001, 'hot', 3);
    INSERT INTO words VALUES (1002, 'hat', 3);
    INSERT INTO words VALUES (1003, 'hit', 3);
    INSERT INTO words VALUES (1004, 'hbt', 3);
    INSERT INTO words VALUES (1005, 'hct', 3);
    INSERT INTO words VALUES (1006, 'john', 4);
    INSERT INTO words VALUES (1007, 'sandy', 5);
    INSERT INTO words VALUES (1008, 'brian', 5);
    INSERT INTO words VALUES (1009, 'hip', 3);
    INSERT INTO words VALUES (1010, 'HOT', 3);
    INSERT INTO words VALUES (1011, 'hOt', 3);
    INSERT INTO words VALUES (1012, 'h9t', 3);
    INSERT INTO words VALUES (1013, 'hoot', 4);
    INSERT INTO words VALUES (1014, 'haaat', 5);
    INSERT INTO words VALUES (1015, 'hooooot', 7);
   
select * from words;
   
-- Q15: List the words that include 'ot' or 'at' (case sensitive)
-- | is used for 'or' operation
select * from words where regexp_like(word, 'ot|at', 'c');


-- Q16: List the words that include 'ot' or 'at' (incase sensitive)
select * from words where regexp_like(word, 'ot|at', 'i');
select * from words where regexp_like(word, 'ot|at');
-- Incase sensivity is default pattern


-- Q17: List the words that start with 'ho' or 'hi' (incase sensitive)
--  ^ means the beginning of the word
select * from words where regexp_like(word, '^ho|hi');
select * from words where regexp_like(word, '^ho|^hi');


-- Q18: List the words that end with 't' or 'y' (incase sensitive)
-- $ means the end of the word
select * from words where regexp_like(word, 't$|y$');
select * from words where regexp_like(word, 't$|y');


-- Q19: List the 3 letter words that start with 'h' and ends with 't' (incase sensitive)
select * from words where regexp_like (word, 'h[a-zA-Z0-9]t');
-- 3 letters 'h[]t'
-- h 1st letter
-- [] 2nd letter
-- t 3rd letter


-- Q20: List the 3 letter words that start with 'h' and ends with 't' (case sensitive)
select * from words where regexp_like(word, 'h[a-zA-Z0-9][a-zA-Z0-9]t', 'c');
select * from words where regexp_like(word, 'h[a-z][a-z]t', 'c');


-- Q21: List the 3 letter words that start with 'h', ends with 't' and second letter is 'a' or 'i' (incase sensitive)
select * from words where regexp_like (word, 'h[a|i]t');


-- Q22: List the words that include with 'i', 'e' or 'm'
select * from words where regexp_like(word, 'i|e|m');
select * from words where regexp_like(word, '[mie]');


-- Q23: List the words that starts with 'a' or 's
select * from words where regexp_like(word, '^a|^s');
select * from words where regexp_like(word, '^[as]');


-- Q24: List the words that include at least two 'o' letter
select * from words where regexp_like(word,'[o][o]');
select * from words where regexp_like(word,'[o]{2}');


-- Q25: List the words that include at least four 'o' letter
select * from words where regexp_like(word,'[o][o][o][o]');
select * from words where regexp_like(word,'[o]{4}');


-- Q26: List the 5 letter words whose all letters are small, first letter is 's' or 'b' and third letter is 'l'  (case sensitive)
select * from words where regexp_like(word, '[sb][a-z]l[a-z][a-z]', 'c');