  -- HOW TO FIX ORA-28001 PASSWORD EXPIRE WARNING.
SELECT * FROM DBA_USERS;
DESC DBA_USERS;
SELECT username, password, account_status, lock_date, expiry_date FROM dba_users WHERE username='HR';

-- ARCHIVE 
-- HOW TO CHECK ARCHIVE MODE
ARCHIVE LOG LIST;
SELECT log_mode FROM v$DATABASE;
-- HOW TO ENABLE ARCHIVE MODE
--1 FIRST SHUT DOWN DATABASE 
SHUTDOWN IMMEDIATE;
--2 START DATABSE IN MOUNT STATE
STARTUP MOUNT;
--3 ALTER NOARCHIVE TO ARCHIVELOG;
ALTER DATABASE ARCHIVELOG;
--4 BRING DATABASE IN OPEN STATE
ALTER DATABASE OPEN;

--CASE MANIPULATION FUNCTIONS 

DESC STUDENT;
-- UPPER
SELECT upper('sonu shaikh') FROM  dual;
INSERT INTO student VALUES(UPPER('shaikh shaha'),11);
SELECT * FROM STUDENT;

-- LOWER
SELECT LOWER('SHAIKH SHAHABAJ') FROM DUAL;
INSERT INTO studENT VALUES(LOWER('SHAIKH SHAHABAJ'),23);

-- INITCAP
SELECT INITCAP('sonu shaikh') FROM dual;
INSERT INTO student VALUES(INITCAP('anita dapke'),95);
SELECT * FROM STUDENT;

-- SQL CHARACTER FUNCTION
-- 1 CONCATE
select concat('sonu',' shaikh') from dual;
SELECT CONCAT(first_name,last_name) AS full_NAME from HR.EMPLOYEES;
SELECT concat(concat(first_name,' '),last_name) AS Full_name FROM hr.employees;

-- 2 SUBSTR (SOURCE_STRING, START_POS, STRING_LENGTH);  FIST TO PARA ARE MANDOTORY.
SELECT SUBSTR('WWW.REBILLIONRIDER.COM',5,14) FROM DUAL;
-- 1st scenario START POSITION GREATE THAN STRING
SELECT SUBSTR('WWW.REBILLIONRIDER.COM',25,14) FROM DUAL;
-- 2st scenario STRING LENGTH IS GRATER THAN STRING LENGTH
SELECT SUBSTR('WWW.REBILLIONRIDER.COM',5,25) FROM DUAL;
-- 3rd scenario arithmatic expression
SELECT substr(50000 - 7, 2,4) FROM DUAL;
SELECT SUBSTR(sysdate,1) FROM DUAL;

-- REPLACE FUNCTION
SELECT REPLACE ('Jack and Jue','J','Bl') FROM dual;
-- DATE FUNCTIONS IN ORACLE
--1 ADD_MONTHS
SELECT ADD_MONTHS('12-1-2017',1) FROM dual;

--2 MONTHS_BETWEEN
SELECT MONTHS_BETWEEN('01-02-1997','11-12-2017') FROM dual;

--3 NEXT_DAY()
SELECT NEXT_DAY('12-11-2017','Sunday') FROM dual;

--4 LAST_DAY()
SELECT LAST_DAY('1-2-2012') FROM dual;

--5 SYSDATE
SELECT SYSDATE FROM dual;

-- CONVERSION FUNCTIONS
-- CREATE TABLE COMMAND  
CREATE TABLE TABLE1
(
  first_name VARCHAR2(30) NOT NULL,
  last_name VARCHAR2(30)NOT NULL,
  email_add VARCHAR2(20)NOT NULL UNIQUE,
  phone_no NUMBER(20) NOT NULL UNIQUE,
  address VARCHAR2(200)NOT NULL
);
DESC table1;
DESCRIBE table1;
DROP TABLE table1;

INSERT INTO table1 VALUES('&first_name','&last_name','&emial_add',&phone_no,'&address');
SELECT * FROM table1;
SELECT * FROM USER_CONSTRAINTS WHERE table_name = 'EMPLOYEES';

--PRIMARY KEY CONSTRAINT
-- USING CREATE TABLE AT COLUMN LEVEL
CREATE TABLE product_master
(
   product_Id NUMBER CONSTRAINT prdmst_pid_pk PRIMARY KEY,
   product_name VARCHAR2(29),
   product_prize NUMBER
  );
  
-- DROP PRODUCT KEY
ALTER TABLE product_master DROP CONSTRAINT prdmst_pid_pk;
-- PK USING ALTER STATEMENT
ALTER TABLE product_master ADD CONSTRAINT prdmst_pn_pk PRIMARY KEY (product_name);
--DISABLE AND DISABLING PRODUCK KEY
ALTER TABLE product_master DISABLE CONSTRAINT prdmst_pn_pk;
--ENABLING AND DISABLING PRODUCK KEY
ALTER TABLE product_master ENABLE CONSTRAINT prdmst_pn_pk;

-- COMPOSITE PRIMARY KEY
DROP TABLE PRODUCT_MASTER;
CREATE TABLE product_master
(
  product_id NUMBER,
  product_name VARCHAR2(30),
  product_prize NUMBER,
  CONSTRAINT prdmst_pk PRIMARY KEY (product_id,product_name)
);

ALTER TABLE product_master DROP CONSTRAINT prdmst_pk;
ALTER TABLE product_master ADD CONSTRAINT promst_pid_pk PRIMARY KEY (product_id);
INSERT INTO product_master VALUES(&product_id,'&product_name',&product_prize);
SELECT * From product_master;
-- HOW TO CHECK CONSTRINT ON TABLE
-- 1 USER_CONSTRAINTS
SELECT
   CONSTRAINT_NAME,
   CONSTRAINT_TYPE,
   TABLE_NAME,
   STATUS,
   INDEX_NAME
FROM USER_CONSTRAINTS WHERE table_name ='PRODUCT_MASTER';

-- USER_CONS_COLUMNS
SELECT
  CONSTRAINT_NAME,
  TABLE_NAME,
  COLUMN_NAME,
  POSITION
FROM USER_CONS_COLUMNS WHERE table_name = 'PRODUCT_MASTER';

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'PRODUCT_MASTER';
SELECT * FROM USER_CONS_COLUMNS WHERE TABLE_NAME = 'PRODUCT_MASTER';

DESCRIBE USER_CONSTRAINTS;
DESCRIBE USER_CONS_COLUMNS;

-- FOREIGN KEY --
-- FOREIGN KEY AT COLUMN LEVEL
CREATE TABLE COMPANY_1
(
  cmp_product_id NUMBER(3) CONSTRAINT cmp_pid_fk REFERENCES product_master(product_Id),
  cmp_name VARCHAR2(30)
  );
DROP TABLE company_1;
INSERT INTO company_1 VALUES(&product_id,'&company_name');

-- FOREING KEY AT TABLE LEVEL
CREATE TABLE company_1
(
   cmp_product_Id NUMBER(2),
   cmp_name VARCHAR2(30)
   --CONSTRAINT cmp_pid_fk FOREIGN KEY (cmp_product_Id) REFERENCES product_master(product_id)
);

DESC product_master;
INSERT INTO product_master VALUES(&product_id,'&product name','&product_prize');
SELECT * FROM product_master;
INSERT INTO company_1 VALUES(1,'Microsoft');
SELECT * FROM company_1;


ALTER TABLE company_1 DROP CONSTRAINT cmp_pid_fk;
-- ON DELETE SET NULL
ALTER TABLE company_1 ADD CONSTRAINT cmp_pid_fk FOREIGN KEY (cmp_product_id) 
REFERENCES product_master(product_id) ON DELETE SET NULL;
--ON DELETE CASCADE
ALTER TABLE company_1 ADD CONSTRAINT cmp_pid_fk FOREIGN KEY (cmp_product_id) 
REFERENCES product_master(product_id) ON DELETE CASCADE;

SELECT * FROM company_1;
SELECT * FROM product_master;
DELETE FROM product_master WHERE product_id = 2;
--RENAME TABLE\COLUMN AND ADD\REMOVE COLUMN FROM EXSTING TABLE

CREATE TABLE rename_demo
(
   first_name VARCHAR2(30)
);

-- RENAME TABLE
ALTER TABLE rename_demo RENAME TO stud_db;

-- ADD COLUMN TO stud_db
ALTER TABLE stud_db ADD last_name VARCHAR2(200);
-- ADD more than one COLUMN TO stud_db
ALTER TABLE stud_db 
ADD
(
  phone_no NUMBER,
  email_add VARCHAR2(255),
  address VARCHAR2(255)
);

-- RENAME COLUMN
ALTER TABLE stud_db RENAME COLUMN email_add TO web_mail;
-- DROP COLUMN
ALTER TABLE stud_db DROP COLUMN address;
-- MODIFY EXISTING COLUMN
ALTER TABLE stud_db MODIFY web_mail NUMBER(3);

DROP TABLE stud_db;

-- SQL JOINS
DESC HR.Departments;
DESC HR.locations;

-- NATURAL JOIN
-- SCENARIO 1 has only one identical column in both source and target table
SELECT department_name,city FROM HR.departments NATURAL JOIN HR.locations;

-- SCENARIO 2 has more one identical column in both source and target table
SELECT first_name,department_name FROM HR.employees NATURAL JOIN HR.departments;

SELECT first_name,department_name FROM HR.employees e JOIN Hr.departments d 
ON (e.manager_id = d.manager_id AND e.department_id = d.department_id);

-- SCHENARIO 3 NATURAL JOIN USING CLAUSE
SELECT first_name,department_name FROM Hr.employees JOIN Hr.departments USING(manager_id);

-- RIGHT OUTER JOIN
CREATE TABLE emp
(
  emp_id NUMBER CONSTRAINT emp_eid_pk PRIMARY KEY,
  emp_name VARCHAR2(30),
  emp_salary NUMBER(8,2)
);

CREATE TABLE dept
(
  dept_id NUMBER,
  dept_name VARCHAR2(30),
  emp_id NUMBER CONSTRAINT dept_eid_fk REFERENCES emp(emp_id)
);


-- DISABLE PRIMARY KEY
ALTER TABLE emp DISABLE CONSTRAINT emp_eid_pk;
-- -- ENABLE PRIMARY KEY
ALTER TABLE emp ENABLE CONSTRAINT emp_eid_pk;
INSERT INTO emp VALUES(&emp_id,'&emp_name',&emp_salary);

-- DISABLE FOREIGN KEY
ALTER TABLE dept DISABLE CONSTRAINT dept_eid_fk;

-- ENABLE FOREIGN KEY
ALTER TABLE dept ENABLE CONSTRAINT dept_eid_fk;


SELECT * FROM dept;
SELECT * FROM emp;

DELETE FROM dept WHERE emp_id = 5 ;--AND emp_id = 5;
INSERT INTO dept VALUES(&dept_id,'&dept_name',&emp_id);

--QUERY 1 RIGHT OUTER JOIN USING 'ON' CLAUSE
-- column have differnect name but same data type
SELECT emp_name,dept_name FROM dept RIGHT OUTER JOIN emp ON(emp.emp_id = dept.emp_id);

--QUERY 2 RIGHT OUTER JOIN UGING 'WHERE' CLAUSE
SELECT emp_name,dept_name,emp_salary FROm dept RIGHT OUTER JOIN emp ON(emp.emp_id = dept.emp_id) WHERE emp_salary <50000;

-- QUERY 3 RIGHT OUTER JOIN USING 'USING' CLAUSE
SELECT emp_id,emp_name,dept_name FROM dept RIGHT OUTER JOIN emp USING(emp_id);
commit;


-- LEFT OUTER JOIN
--QUERY 1 LEFT OUTER JOIN USING 'ON' CLAUSE
SELECT emp_name,dept_name FROM emp LEFT OUTER JOIN dept ON(emp.emp_id = dept.emp_id);

-- LEFT OUTER JOIN USING 'WHERE' CLAUSE
SELECT emp_name,dept_name FROM emp LEFT OUTER JOIN dept ON(emp.emp_id = dept.emp_id) WHERE emp_salary > 50000;

-- LEFT OUTER JOIN USING 'USING' CLAUSE
SELECT emp_name,dept_name,emp_salary FROM emp LEFT OUTER JOIN dept USING(emp_id);

--FULL OUTER JOIN
--QUERY-1 FOJ USING ON CLAUSE
SELECT emp_name,dept_name,emp_salary FROM emp FULL OUTER JOIN dept ON (emp.emp_id = dept.emp_id);

-- QUERY 2 FOJ USING 'USING'
SELECT emp_name,dept_name FROM emp FULL JOIN dept USING(emp_id);

-- QUERY 3 FOJ USING 'WHERE' CLAUSE
SELECT emp_name,dept_name,emp_salary FROM emp FULL JOIN dept USING(emp_id) WHERE emp_salary >2000;

-- QUERY 4 FOJ USING 'ORDER BY' CLAUSE
SELECT emp_name,dept_name,emp_salary FROM emp FULL JOIN dept USING(emp_id) WHERE emp_salary > 1000 ORDER BY emp_name;

SELECT emp_name,dept_name,emp_salary FROM emp FULL JOIN dept USING(emp_id) WHERE emp_salary > 1000 ORDER BY emp_name DESC;

-- INNER JOIN
-- IJ WITH ON CLAUSE
SELECT emp_name,dept_name FROM emp INNER JOIN dept ON(emp.emp_id = dept.emp_id);

-- INNER JOIN USING 'USING' CLAUSE
SELECT emp_name,dept_name,emp_salary FROM emp INNER JOIN dept USING(emp_id);


-- CROSS JOIN (ALSO known as cartetian product.)
-- QUERY 1
SELECT emp_name,dept_name FROM emp CROSS JOIN dept;

-- QUERY 2
SELECT emp_name,dept_name FROM emP,dept;

-- QUERY 3 
SELECT emp_name,dept_name FROM emp CROSS JOIN dept WHERE dept_name = 'IT';

-- QUERY 4
SELECT emp_name,dept_name FROM emp CROSS JOIN dept ORDER BY dept_name;

-- STUDENT TABLE
DROP TABLE STUDENT;
-- HOW TO INSERT COPY DATA INTO ONE TABLE TO ANOTHER TABLE

CREATE TABLE STUDENT
(
 stud_id NUMBER(2),
 first_name VARCHAR2(30),
 last_name VARCHAR2(30),
 contact_no NUMBER(10) CONSTRAINT check_phone_no CHECK(LENGTH(contact_no) = 5)
 );

INSERT INTO STUDENT VALUES(&stud_id,'&first_name','&last_name',&contact_no);
SELECT * FROM student; 

CREATE TABLE STUDENTCOPY
(
 stud_id NUMBER(2),
 first_name VARCHAR2(30),
 last_name VARCHAR2(30),
 contact_no NUMBER(10) CONSTRAINT SC_check_phone_no CHECK(LENGTH(contact_no) = 5)
 );
 
ALTER TABLE STUDENTCOPY DROP CONSTRAINT SC_check_phone_no;
DELETE FROM studentcopy;
SELECT * FROM studentcopy;

--QUERY 1 HOW TO INSERT ENTIRED DATA.
INSERT INTO studentcopy SELECT * FROM student;


--QUERY 2 HOW TO INSERTE SELECTIVE DATE
INSERT INTO studentcopy(first_name,last_name) SELECT first_name,last_naME FROM student;

--QUERY 3 USING WHERE CLAUSE
INSERT INTO studentcopy SELECT * FROM student WHERE stud_id = 2;


-- SQL DELETE AND TRUNCATE STATMENT

COMMIT;
SAVEPOINT sp_19_11_2017;
SELECT * FROM student;

delete from student WHERE stud_id = 2;
COMMIT;
SAVEPOINT sp_19_11_2017_2;

ROLLBACK TO sp_19_11_2017_2;

TRUNCATE TABLE student;
-- CREATE USER USING 'CREATE USER' CLAUSE
CREATE USER user_sonu IDENTIFIED BY sonumonu
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users
PROFILE default
PASSWORD expire
ACCOUNT UNLOCK;

-- grant create session privilege
GRANT CREATE SESSION TO user_sonu;

-- LOCK USER
ALTER USER user_sonu ACCOUNT lock;
-- DROP USER
DROP USER user_sonu;

-- HOW TO DROP USER WHEN IT CONNECTED TO DATABASE

--STEP 1 CONNCECT WITH DATABASE WITH SYSDBA PRIVILEGE.
SHOW USER;

--STEP 2 NOW WE HAVE TO PUT OUR DATABASE IN RESTRICTION MODE 
ALTER SYSTEM ENABLE restricted session;
--[By default our database was in open startup mode and now we just changed the mode from open to restricted. 
--When the database is started in a restricted mode, the users that are already connected can continue their work without any
--interruption unless they are somehow disconnected. 
--Once any of them are disconnected they have to have a restricted session privilege which is a special system privilege to 
--connect with the database again. Furthermore no new user can connect with a database]

--STEP3 NOW WE HAVE TO GET SESSION IDENTIFIER AND SERIAL NUMBER OF THAT USER WE WISH TO DELETE.
-- THAT PUPOSE WE USE v$session VIEW

SELECT sid,serial# FROM v$session WHERE username='SUPERMAN';

-- STEP 4 NOW WE HAVE TO KISS SESSION AND DISCONNECT USER FROM DATABASE USING sid and serial#
ALTER SYSTEM KILL session'12,2125';

--STEP5 NOW USER IS DISCONNECTED AND WE ARE FREE TO DROP IT
DROP USER superman CASCADE;

--STEP 6 DATABASE STILL IN RESTICTED MORE BRING IT IN NORMAL MODE
ALTER SYSTEM disable RESTRICTED SESSION;

-- HENCE WE HAVE SUCCESSULY DELETED USER AND BRING OUR DATABASE INTO NORMAL STAGE.

-- HOW TO LIMIT THE NO OF ROW USING ROWNUM FUNCTIONS.
SELECT first_name,last_name,employee_id FROM hr.employees WHERE ROWNUM <= 3;
SELECT first_name,last_name,employee_id FROM hr.employees WHERE ROWNUM <= 9 ORDER BY first_name DESC;

SELECT First_name from hr.EMPLOYEES where EMPLOYEE_iD = &emp_Id;

--PRIVILEGES IN ORACLE
--TWO TYPE OF PRIVILEGS 
-- 1 SYSTEM 
-- 2 OBJECT
 CREATE USER hulk IDENTIFIED BY hulk;
 CREATE USER sup IDENTIFIED BY sup;
 CREATE USER cat IDENTIFIED BY cat;

-- HOW TO GRANT SYSTEM PRIVILEGS 
GRANT CREATE TABLE TO hulk;

-- HOW TO REVOKE SYSTEM PRIVILEGS 
REVOKE CREATE TABLE FROM hulk;

--HOW TO GRANT MORE THAN ONE SYTEM PRIVILEG TO ONE USER
GRANT create table, create synonym, create view TO hulk;

-- REVOKE MULTIPLE PRIVILEGES FROM ONE USER
REVOKE create table,create synonym, create view FROM hulk;

-- HOW TO GRANT PRIVILEGS TO MORE THAN ONE USER
GRANT CREATE TABLE , CREATE VIEW, CREATE SYNONYM TO hulk, cat,sup;

-- HOW TO REVOKE PRIVILEGS FROM MORE THAN ONE USER
REVOKE CREATE TABLE , CREATE VIEW, CREATE SYNONYM FROM hulk, cat,sup;

-- GRANT SYSTEM PRIVILAGES WITH ADMIN OPTION
GRANT CREATE SESSION,CREATE TABLE TO hulk WITH ADMIN OPTION;
/*
GRANT CREATE SESSION TO cat;

Grant succeeded. 
SQL> REVOKE CREATE SESSION FROM CAT;

Revoke succeeded.
*/
-- REVOKE SYSTEM PRIVILAGES WITH ADMIN OPTION
REVOKE CREATE SESSION,CREATE TABLE FROM hulk;

-- OBJECT PRIVILEGS
-- SYNTAX
-- GRANT OBJ_PRIVILEG ON OBJ_NAME TO USER_NAME;
-- HOW TO GRANT OBJ PRIVILEG TO 
GRANT SELECT ON HR.EMPLOYEES TO hulk;

-- HOW TO REVOKE OBJ PRIVILEG
REVOKE SELECT ON HR.EMPLOYEES FROM hulk;

-- HOW TO GRANT MULTIPLE PRIVILEG TO USER / ALL DDL STATMENT USER
GRANT SELECT,UPDATE,DELETE,INSERT ON hr.employees TO hulk;
GRANT ALL ON hr.employees TO hulk,cat,sup;

-- HOW TO REVOKE MULTIPLE PRIVILEG TO USER / ALL DDL STATMENT USER
REVOKE ALL ON hr.employees FROM hulk,cat,sup;

-- OBJECT PRIVILEG ON COLUMN LEVELS
-- WE CAN ONLY GRANT INSERT,UPDATE AND REFERENCE ojb privilegs to any user
GRANT INSERT(salary) ON hr.employees TO hulk;
GRANT INSERT(employee_id) ON  hr.employees TO hulk;
GRANT update(employee_id) ON  hr.employees TO hulk;
GRANT REFERENCES(employee_id) ON  hr.employees TO hulk;

-- REVOKE OBJECT PRIVILAGES ON COLUM LEVEL
--REVOKE INSERT(salary) ON hr.employees TO hulk;
--REVOKE update(employee_id) ON hr.employees TO hulk;
-- ABOVE STATEMENT IS NOT VALID WE CAN ONLY REVOKE OJB PRIVILEGE ON WHOLE NOT ON COLUMN LEVEL

REVOKE INSERT,UPDATE, REFERENCES ON hr.employees FROM hulk;

-- GRANT OBJECT PRIVILEGE WITH GRANT OPTION
GRANT select ON hr.employees TO hulk WITH GRANT OPTION;
GRANT CREATE SESSION TO hulk,cat;
-- REVOKE OBJECT PRIVILEGE 
REVOKE SELECT ON hr.employees  FROM hulk;

-- HOW TO CHECK WITH TYPE OF PRIVILEGS USER DOES HAVE.
SELECT * FROM USER_ROLE_PRIVS-- WHERE username = 'HULK';
SELECT * FROM USER_TAB_PRIVS;-- WHERE GRANTEE = 'HULK';
SELECT * FROM USER_SYS_PRIVS;-- WHERE USERNAME = 'HULK';
COMMIT;
DESC USER_ROLE_PRIVS;


-- ROLE IN ORACLE DATABASE
--Q1 ROLE WITH NOT IDENTIFIED CLAUES
CREATE ROLE demo1 NOT IDENTIFIED ;
--Q2 ROLE WITH IDENTIFIED BY CLAUSE
CREATE ROLE demo2 IDENTIFIED BY password123;
--Q3 ROLE WITH EXTERNAL
CREATE ROLE demo3 IDENTIFIED BY EXTERNALLY;
--Q4 ROLE WITH GOBLALY
CREATE ROLE demo4 IDENTIFIED BY GLOBALLY;

--Q5 GRANT SYSTEM PRIVILEGE TO ROLE WITH ADMIN OPTION
GRANT create table,CREATE SESSION TO demo1;
--Q6 GRANT OBJECT PRIVILEG
--NOTE YOU CAN'T GRANT OBJECT PRIVILEGE WITH GRANT OPTION
GRANT SELECT ON hr.employees TO demo3;
--Q7 HOW TO GRANT ONE ROLE TO ANOTHER ROLE
GRANT demo1 TO demo2;
--Q8 GRANT ROLE demo2 (WITH PASSWORD ) TO USER;
GRANT demo2 TO CAT;
--Q9 HOW TO ENABLE ROLE USING SET ROLE STATEMENT.
SET ROLE demo2 IDENTIFIED BY password123;
-- DROP ROLES
DROP ROLE DEMO1;
DROP ROLE demo2;
DROP ROLE demo3;
DROP ROLE demo4;

--CASE EXPRESSION IN ORACLE
--1 SIMPLE CASE EXPRESSION
SELECT first_name,department_id,
 (CASE department_id
  WHEN 10 THEN 'Administrator'
  WHEN 20 THEN 'Marketing'
  WHEN 30 THEN 'Purchasing'
  WHEN 40 THEN 'Shipping'
  WHEN 50 THEN 'Shipping'
  ELSE 'SORRY No Result Found'
  END) AS DEPARTMENTS
FROM HR.EMPLOYEES 
WHERE department_id  BETWEEN 10 AND 50
ORDER BY 2; 

-- QUERY 2
SELECT 
CASE 'DBA'
  WHEN 'DBA' THEN '1 TRUE'
  WHEN 'DBC' THEN '2 FALSE'
  WHEN 'DBAC' THEN '3 FLASE'
  WHEN 'DBA' THEN '4 TRUE'
  ELSE 'SORRY'
END
 AS RESULT
FROM DUAL;

-- SEARCH CASE EXPRESSIONS
CREATE TABLE friend_list
( fname VARCHAR2(30),
  lname VARCHAR2(30) 
);

INSERT INTO friend_list VALUES('&First_name','&Last_name');
SELECT * FROM friend_list;

SELECT fname,lname,
( CASE
    WHEN fname='Anita' AND lname = 'Dapke' THEN 'FEMALE FRIEND'
    WHEN fname='Mayur' AND lname = 'Pathrikar' THEN 'MALE FRIEND'
    WHEN fname='Shital' AND lname= 'Ragade' THEN 'FEMALE FRINED'
    WHEN fname='Ashish ' AND lname= 'Balid' THEN 'MALE FRINED'
  ELSE 'SORRY NOT A FRIEND'
END) AS FIREDN_LIST
FROM friend_list;

-- DECODE FUNCTION IN ORACLE
-- DECODE FUNCTION IS ONLY CAPABLE OF PERFOMING EQULITY OPRATIONS
SELECT DECODE('Anita Dapke','Anita Dapke','True, String Matched','False,String Dont Match') AS RESULT FROM DUAL;

-- QUERY 2
SELECT * FROM GUESSTHECAPITAL;
INSERT INTO GUESSTHECAPITAL VALUES('Arab',' 2D');
SELECT country_name,capital_id,
DECODE(capital_id,
   '1D',  'DEHLI',
   '1L',  'LONDON',
   '1W',  'WASHINGTON D.C',
   '1T',  'TOKYO',
       'SORRY dont find any capital regading this id'
) AS CAPITALS
FROM GUESSTHECAPITAL;


-- SQL VIEWS
DESCRIBE DBA_VIEWS;
SELECT * FROM DBA_VIEWS;

-- SIMPLE VIEW 
CREATE VIEW vw_emp_tbl AS 
 SELECT first_name,department_id,salary From HR.EMPLOYEES;
 
DESCRIBE vw_emp_tbl;
DESC HR.EMPLOYEES;
-- HOW TO RECREATE VIEW
CREATE OR REPLACE VIEW vw_emp_tbl AS
 SELECT first_name,last_name,email,phone_number FROM hr.employees;
 
SELECT * FROM vw_emp_tbl ORDER BY 2 DESC;

-- HOW TO UPDATE RECORD IN VIEW
UPDATE vw_emp_tbl SET email = 'shanta.kts@tcs.com' WHERE first_name= 'Shanta';
SELECT * FROM vw_emp_tbl WHERE first_name = 'Shanta';
SELECT * FROM HR.employees WHERE first_name = 'Shanta';

-- HOW TO DELETE ROW FROM VIEW
DELETE FROM vw_emp_tbl WHERE first_name = 'Shanta';

-- COMPLEX VIEW
CREATE OR REPLACE VIEW vw_join AS
SELECT first_name,department_name FROM 
hr.employees emp FULL OUTER JOIN hr.departments dept 
ON(emp.department_Id = dept.department_id);

SELECT * FROM vw_join ORDER BY department_name;

--SQL SEQUENCE IN ORACLE DATABAE
CREATE SEQUENCE sq_demo
START WITH 1
INCREMENT BY 1
MAXVALUE 10
MINVALUE 1
CACHE 3
NOCYCLE
NOORDER;

-- DEFAULT SEQUENCE 
CREATE SEQUENCE sq_demo1;

--INITILIZE THE SEQUENCE
SELECT sq_demo.NEXTVAL FROM DUAL;
-- CURRVAL
SELECT sq_demo.CURRVAL FROM dual;
DROP SEQUENCE sq_demo;
-- HOW TO USER SEQUENCE TO INSERT VALUES IN TABLE
CREATE TABLE demo
( 
  rollno NUMBER CONSTRAINT demo_rollno_pk PRIMARY KEY,
  name VARCHAR2(30)
);


INSERT INTO demo VALUES(sq_demo.NEXTVAL,'&Name');
SELECT * From demo;

-- INDEX IN ORACLE DATABASE
-- UNIQUE INDEX
CREATE UNIQUE INDEX ind_demo_rollno ON demo(name) TABLESPACE users;
-- DROP INDEX
DROP INDEX ind_demo_rollno;

-- FUNCTION BASE INDEX
CREATE INDEX ind_demo_name ON demo(UPPER(name));-- ON TABLESPACE users;
INSERT INTO DEMO VALUES(13,'Salman Khan');
SELECT * FROM demo;

-- SET OPERATOR IN ORACLE DATABASE
-- THERE ARE FOUR SET OPERATOR
--THESE ARE UNION,UNION ALL, INTERSECT, MINUS

CREATE TABLE cricket
(
  first_name VARCHAR2(30),
  last_name VARCHAR2(30)
);

CREATE TABLE football
(
  first_name VARCHAR2(30),
  last_name VARCHAR2(30)
);

INSERT INTO cricket VALUES ('&first_name','&last_name');
INSERT INTO football VALUES ('&first_name','&last_name');

SELECT * FROM cricket;
SELECT * FROM football;


-- UNION OPERTOR (RETURN ALL ROW FROM BOTH PARTICIPATING QUEEIES EXCEPT DUPLICATE
SELECT FIRST_NAME,LAST_NAME FROM CRICKET
UNION
SELECT FIRST_NAME,LAST_NAME FROM FOOTBALL;

-- UNION ALL OPERTOR (RETURN ALL ROW FROM BOTH PARTICIPATING QUEEIES INCLUDING DUPLICATE
SELECT FIRST_NAME,LAST_NAME FROM CRICKET
UNION ALL
SELECT FIRST_NAME,LAST_NAME FROM FOOTBALL;


-- INSESECT 
-- ITERSECT OPERTOR (RETURN ONLY THAT ROW WHICH IS COMMON IN BOTH PARTICIPATING QUEEIES )
SELECT FIRST_NAME,LAST_NAME FROM CRICKET
INTERSECT
SELECT FIRST_NAME,LAST_NAME FROM FOOTBALL;

-- MINUS OPERTOR (RETURN ONLY THOSE ROW FROM FIRST QUERY WHICH ARE NOT PRESENT IN SECOND QUERY)
SELECT FIRST_NAME,LAST_NAME FROM CRICKET
MINUS
SELECT FIRST_NAME,LAST_NAME FROM FOOTBALL;


-- RESTRICTIONS ON SET OPERATOR.
-- NO OF COLUMNS IN BOTH QUERIES SHOULD SAME AS WELL AS DATATYPE ALSO SAME.

CREATE TABLE demo_emp
(
   first_name VARCHAR2(30),
   age NUMBER(2)
);

INSERT INTO demo_emp VALUES('&first_name',&age);
SELECT * FROM demo_emp;

SELECT first_name,last_name FROM cricket
UNION
select first_name,TO_CHAR(age) FROM demo_emp;

-- SUB QUERIES
--QUERY 1
--To determine who works in the same department as employee 'Lorentz', issue the following statement:

SELECT last_name,department_id   FROM hr.employees
WHERE department_id = 
( SELECT department_id FROM hr.employees WHERE last_name = 'Lorentz') ;

--To give all employees in the employees table a 10% raise if they have changed jobs
--that is, if they appear in the job_history table--issue the following statement:

-- QUERY 2
UPDATE hr.employees 
SET salary = salary * 1.1
WHERE employee_id IN (SELECT employee_id FROM hr.job_history);


SELECT emp.last_name,emp.employee_id,emp.salary  As Rais FROM hr.employees emp, hr.job_history hst
WHERE emp.employee_id = hst.employee_id;

--To create a second version of the departments table new_departments, 
--with only three of the columns of the original table, issue the following statement:
--QUERY 3
CREATE TABLE departments_new AS
SELECT department_id,department_name,location_id FROM HR.departments;
SELECT * FROM departments_new;

--The following query uses a self join to return the name of each employee along 
--with the name of the employee's manager. A WHERE clause is added to shorten the output.

-- FIND OUT THE LIST OF MANAGERS
SELECT first_name,last_name,employee_id FROM HR.employees 
WHERE employee_id IN (SELECT DISTINCT manager_id FROM HR.employees);

SELECT e1.first_name FROM HR.employees e1,HR.employees e2 
WHERE e1.employee_id = e2.manager_id ;
--ORDER BY ;

SELECT * FROM HR.employees WHERE ROWNUM < 10;
SELECT * FROM HR.employees WHERE manager_id != null;

--QUERY 3
SELECT e1.first_name e2.last_name FROM HR.employees e1,HR.employees e2
WHERE e1.manager_id = e2.employee_id;

-- type of sub queries
--1 SINGLE ROW SUBQURIES(RETURN ONLY ONE ROW)

-- FIND OUT THE ALL EMP WHOS SALARY IS LESS THAN AVGRAGE OF SALARY
SELECT p.first_name,p.department_id,p.salary FROM HR.employees p
WHERE p.salary < (SELECT AVG(salary) FROM HR.employees s 
WHERE p.department_id = s.department_id);
/*
SELECT p.first_name,p.department_id,p.salary FROM HR.employees p
WHERE p.salary < 6501.961904761904761904761904761904761905;
SELECT AVG(salary) FROM HR.employees s 
WHERE s.department_id = s.department_id; */

--QUERY 4 DETERMINE WHO EARN MORE THAN MR.Tobis
SELECT first_name,employee_id FROM HR.employees WHERE SALARY >
(SELECT salary FROM hr.employees WHERE last_name = 'Tobias')
ORDER BY last_name;

-- CREATE SYNONYM
CREATE OR REPLACE SYNONYM syn_employees FOR HR.employees; 
SELECT * FROM syn_employees;

-- CREATE PUBLIC SYNONYMK
CREATE OR REPLACE PUBLIC SYNONYM syn_employees FOR HR.employees@remote.us.oracle.com;
DROP SYNONYM syn_employees;





















