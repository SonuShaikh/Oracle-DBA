-- USER PRIVILEGES
-- TWO TYPE OF PRIVELAGES 1 SYSTEM PRIVILETE AND OBJECT PRIVILEGE
-- SYSTEM PRIVILEGE
GRANT create table to sonumonuuser;
GRANT create view, create sequence to sonumonuuser WITH ADMIN OPTION;
GRANT CREATE SESSION TO sonumonuuser,user1;

GRANT select ON sonumonuuser.student TO user1;
GRANT SELECT,DELETE,INDEX ON sonumonuuser.student to user1;
GRANT UPDATE(first_name) ON sonumonuuser.student to user1;
--GRANT ALL ON sonumonuuser.student
REVOKE ALL ON sonumonuuser.student FROM user1;

-- Roles
CREATE ROLE role1 NOT IDENTIFIED;
CREATE ROLE role2 IDENTIFIED BY password123;
GRANT ALL ON sonumonuuser.student TO role1;
GRANT SELECT ON sonumonuuser.student TO role2;
GRANT role1 TO role2;
GRANT role1 TO USER1;
GRANT role2 to USER1;

SET ROLE role2 IDENTIFIED BY password123;

drop ROLE role1;
drop ROLE role2;

-- Case Expressiong from 
SELECT
  (CASE 'Gmail'
    WHEN 'Yahoo' THEN 'I Got You.!'
    WHEN 'Gmail' THEN 'Google Mail Always Best..!'
    ELSE 'Sorry You Dont have permission to user another mail service'
    END ) AS RESULT
    FROM dual;

CREATE TABLE teacher
( 
   T_ID NUMBER PRIMARY KEY,
   NAME VARCHAR2(20)
   );
 INSERT INTO teacher VALUES(&Teacher_Id,'&Teacher_Name');
 SELECT * FROM teacher;
 
 -- CASE EXPRESSION
 SELECT name,
 (CASE (name)
  WHEN 'Gaikwad' THEN 'PHP PROGRAMMING'
  WHEN 'Manisha' THEN 'Cyber Ethics Law'
  WHEN 'Priyanka' THEN 'Android Programming'
  WHEN 'Aaradhana' THEN 'Computer Graphics'
  WHEN 'Lagane'    THEN 'Theory Of Compution'
  WHEN 'Nitin'     THEN 'Software Quality And Testing'
  ELSE 'DONT TEACH ANY SUBJECT'
  END ) AS SUBJECT
  FROM teacher;
  
-- DECODE function 
-- Query1: Simple Decode Function
 SELECT DECODE('Sonu','Sonu','True, Sting is Matched','False, String does not matched') As result FROM dual;
   
CREATE TABLE guessthecapital
(
  country_Id NUMBER,
  country_name VARCHAR2(20)
  );
  ALTER TABLE guessthecapital MODIFY (country_Id VARCHAR2(5));
INSERT INTO guessthecapital VALUES('1D','INDIA');
INSERT INTO guessthecapital VALUES('2W','USA');
INSERT INTO guessthecapital VALUES('3D','BANGLADESH');
INSERT INTO guessthecapital VALUES('4K','NEPAL');
INSERT INTO guessthecapital VALUES('5K','PAKISTAN');
INSERT INTO guessthecapital VALUES('6L','ENGLAND');
INSERT INTO guessthecapital VALUES('7T','JAPAN');

SELECT * FROM GuessTheCapital;
SELECT country_Id, country_name,
   DECODE(country_Id,
    '1D','DEHLI',
    '2W','WASHINGTON D.C',
    '3D','DHAKA',
    '4K','KATMANDU',
    '5K','KARACHI',
    '6L','LONDON',
    '7T','TOKIYO',
        'Sorry'      
    ) AS CAPITALS
  FROM GuessTheCapital;
  
  

SELECT first_name,email,phone_number FROM employees;

-- VIEW IN ORACLE
CREATE VIEW employee_details AS
   SELECT first_name,email,phone_number FROM employees;
DESCRIBE employee_details;
-- SELECT ON VIEW
SELECT * FROM employee_details WHERE first_name='Nancy';
-- UPDATE ON VIEW
UPDATE employee_details SET email='nancy@gmail.com' WHERE first_name = 'Nancy';

-- DELETE ON VIEW
DELETE FROM employee_details WHERE first_name = 'Nancy';

-- INSERT ON view
INSERT INTO employee_details (first_name,email,phone_number) values('Sonu','Sonu@gmail.com',9623858600);


CREATE TABLE babes
(
    name VARCHAR2(30),
    age NUMBER,
    bf_name VARCHAR(30),
    ph_number number
    );
    
INSERT INTO babes  values('&name',&age,'&bf_name',&phone_number);
SELECT * FROM babes;
-- Views
CREATE VIEW vw_babes AS
    SELECT name,age,ph_number FROM babes;
  SELECT * FROM vw_babes;
  INSERT INTO vw_babes VALUES ('Dimple',20,9623858655);
  
-- UPDATE VIES
CREATE OR REPLACE VIEW vw_babes AS
  SELECT name,age FROM BABES;



-- SEQUENCES
CREATE SEQUENCE sq_ai_id 
START WITH 1
INCREMENT BY 1
NOMAXVALUE
MINVALUE 1
CACHE 3
NOCYCLE
ORDER;

DROP SEQUENCE sq_ai_id;
SELECT sq_ai_id.CURRVAL  FRom DUAL;

-- INITIALIZE FIRST
SELECT sq_ai_id.NEXTVAL FROM dual;

CREATE TABLE sequece_demo
(
    user_id NUMBER(2) CONSTRAINT ai_pk PRIMARY KEY,
    Name VARCHAR2(20)
    );
    
INSERT INTO sequece_demo VALUES (sq_ai_id.NEXTVAL,'&Name');
SELECT * FROM sequece_demo;

CREATE UNIQUE INDEX unique_phone_number ON babes(ph_number) TABLESPACE users;
CREATE INDEX bf_name_upper ON babes(UPPER(bf_name)) TABLESPACE users;

--LPAD
SELECT LPAD('SONUSHAIKH',20,' ') FROM dual;
--RPAD 
SELECT RPAD('SONUSHAIKH',20,'*' ) FROM dual;
-- LPAD ON COLUMN
SELECT LPAD(salary,20,'*') FROM employees;
-- RPAD ON COLUMN
SELECT RPAD(salary,20,'*') FROM employees;

SELECT commission_pct, commission_pct + 100 FROM employees WHERE salary > 13000;

-- NVL FUNCTION
SELECT NVL(commission_pct,0) as commision, NVL(commission_pct,0) + 100 AS commission FROM employees WHERE salary > 13000;

select * from v$log;
select * from v$logfile;

SELECT * FROM babes;
SELECT * FROM babes WHERE bf_name IS  NULL;
SELECT * FROM employees WHERE employee_id = ANY (100,110,120);
SELECT * FROM employees WHERE employee_id  < ANY(110);
SELECT * FROM employees WHERE employee_id = ALL (100,110,220);
SELECT * FROM employees WHERE employee_id < ALL(105,110,120);
SELECT * FROM employees WHERE employee_id = SOME (100,110,120);
SELECT first_name,salary FROM employees ORDER BY salary DESC;
select * from employees order by commission_pct NULLS FIRST;
select * from employees order by commission_pct NULLS LAST;
SELECT * FROM employees ROLLUP(first_name);

CREATE TABLE product_order
(
  product_Id NUMBER,
  product_name VARCHAR2(30),
  product_price NUMBER
  );
INSERT INTO product_order VALUES(sq_ai_id.NEXTVAL,'&PRODUCT_NAME',&PRODUCT_PRICE);
SELECT * FROM product_order;
SELECT product_name ,COUNT(product_name), sum(product_price)AS TOTAL_SALE FROM product_order GROUP BY product_name;

SELECT LTRIM('              HELLO WORLD','."') FROM DUAL;
SELECT first_name FROM employees WHERE first_name LIKE '%a%';
SELECT first_name FROM employees WHERE SOUNDEX(first_name) = SOUNDEX('SARAAH');

SELECT * FROM EMPLOYEES WHERE employee_Id = 100;
SELECT first_name , last_name , email , GREATEST(employee_id,department_id) AS  High, LEAST(employee_id,department_id) AS low FROM employees;

-- DATE
-- query1
SELECT sysdate FROM dual;
-- Query 2
SELECT current_date FROM dual;
-- Query3
SELECT RTRIM(systimestamp,) FROM dual;



CREATE TABLE netcafe
(
   user_id NUMBER CONSTRAINT ai_pk_nc PRIMARY KEY,
   user_name VARCHAR2(30) NOT NULL ,
   start_time DATE DEFAULT sysdate,
   end_time DATE 
   );
  DESC NETCAFE; 
  ALTER TABLE netcafe MODIFY start_time DATE DEFAULT systimestamp ;
  ALTER TABLE netcafe MODIFY end_time DATE ;
  INSERT INTO netcafe (user_id,user_name) VALUES(sq_ai_id.NEXTVAL,'&User_Name');
  UPDATE netcafe SET end_time = systimestamp WHERE user_name = 'Anita';

   SELECT * FROM NETCAFE;


desc babes;
INSERT INTO babes(name , ph_number) SELECT first_name, salary FROM employees WHERE employee_id = 120;
SELECT * FROM babes;
SELECT * FROM employees;
DELETE FROM babes WHERE age IS NULL;

DESC employees;
DESC babes;









