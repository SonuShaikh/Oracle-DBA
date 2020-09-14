SELECT * FROM EMP;
SELECT * FROM DEPT;
ALTER TABLE emp MODIFY( emp_salary NUMBER(8,2)default 1000 );
ALTER TABLE EMP MODIFY (emp_salary NUMBER(8,2));
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = UPPER('DEPT');
ALTER TABLE DEPT ENABLE CONSTRAINT dept_eid_fk;
ALTER TABLE emp ENABLE CONSTRAINT emp_eid_pk;
DELETE FROM emp;

INSERT INTO emp VALUES(&emp_Id,'&emp_name',&salary);

DESC dept;
DESC emp;
ROLLBACK;

--You need to generate a report that displays all department names along with the corresponding average salary.
ALTER TABLE emp ADD( dept_id NUMBER );
UPDATE emp SET dept_id =&dept_id WHERE emp_id = &emp_id;
ALTER TABLE dept DROP COLUMN emp_id;

SELECT dept_name,ROUND(AVG(emp_salary),2) FROM EMP FULL OUTER JOIN DEPT USING(dept_id) GROUP BY dept_name;
--You want to find the highest average salary being paid in any department
SELECT MAX(AVG(emp_salary)) FROM emp  GROUP BY dept_id;
SELECT AVG(emp_salary) FROM emp  GROUP BY dept_id;

CREATE TABLE PROMOTIONS
(
 promotion_id NUMBER,
 promo_category VARCHAR2(40),
 promo_sub_category VARCHAR2(40)
 );
 
INSERT INTO promotions VALUES(&promotions_Id,'post','discount');
SELECT * FROM promotions;

--You need to display all promo categories that do not have 'discount' 
--in their subcategory.Which two SQL statements give the required result? 

SELECT promo_category FROM promotions MINUS
SELECT promo_category FROM promotions WHERE promo_sub_category = 'discount';

SELECT promo_category FROM promotions INTERSECT
SELECT promo_category FROM promotions WHERE promo_sub_category <> 'discount';

DESC hr.employees;

SELECT first_name,last_name FROM hr.EMPLOYEES ORDER BY first_name OFFSET 10 ROWS FETCH next 5 ROWS;

SELECT last_name FROM 
   (SELECT last_name, ROW_NUMBER() OVER (ORDER BY last_name) R FROM HR.employees)
   WHERE R BETWEEN 5 and 10;

SELECT last_name FROM (select last_name,row_number() OVER(order by last_name) r FROM hr. employees)
  WHERE r BETWEEN 2 AND 8;

DESCRIBE USER_CONSTRAINTS;
SELECT CONSTRAINT_NAME,CONSTRAINT_TYPE,TABLE_NAME,DELETE_RULE FROM USER_CONSTRAINTS 
WHERE TABLE_NAME = 'EMP';--IN('EMPLOYEES','DEPARTMENT','LOCATION'); 
DESCRIBE EMPLOYEES;
CREATE TABLE EMP AS SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,HIRE_DATE,DEPARTMENT_ID FROM EMPLOYEES;
ALTER TABLE EMP ADD CONSTRAINT emp_eid_pk PRIMARY KEY (employee_id);
ALTER TABLE EMP DROP CONSTRAINT emp_eid_pk;
DESC DEPARTMENTS;

CREATE TABLE DEPT AS SELECT DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID FROM DEPARTMENTS;

SELECT * FROM DEPT;
ALTER TABLE DEPT ADD CONSTRAINT dept_did_pk PRIMARY KEY(department_id);
ALTER TABLE EMP ADD CONSTRAINT emp_did_fk FOREIGN KEY(department_id) REFERENCES DEPT(department_id) ON DELETE CASCADE;

SELECT TABLE_NAME,CONSTRAINT_NAME,CONSTRAINT_TYPE,DELETE_RULE FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'DEPT';
SELECT * FROM EMP WHERE DEPARTMENT_ID IS NULL;
DELETE FROM DEPT WHERE DEPARTMENT_ID = 10;

ALTER TABLE emp DROP CONSTRAINT emp_did_fk;

ALTER TABLE EMP ADD CONSTRAINT emp_did_fk FOREIGN KEY(department_id) REFERENCES DEPT(department_id) ON DELETE CASCADE;

SELECT * FROM EMP WHERE EMPLOYEE_ID = 202;
DELETE FROM DEPT WHERE DEPARTMENT_ID = 20;
-- SQL JOIN
--FIND THE MANAGER,
SELECT E2.EMPLOYEE_ID,E2.FIRST_NAME AS EMPLOYEE_NAME,E1.FIRST_NAME AS MANAGER_NAME FROM EMPLOYEES E1,EMPLOYEES E2 
WHERE E1.EMPLOYEE_ID = E2.MANAGER_ID ORDER BY 3;

-- NATURAL JION ONLY ONE COLUMN IS IDENTICAL BETWEEN THEM.
SELECT DEPARTMENT_ID,DEPARTMENT_NAME,LOCATION_ID,CITY,COUNTRY_ID FROM DEPARTMENTS NATURAL JOIN LOCATIONS;
SELECT DEPARTMENT_ID,DEPARTMENT_NAME,LOCATION_ID,CITY,COUNTRY_ID FROM DEPARTMENTS NATURAL JOIN LOCATIONS;
-- TWO IDENTICAL COLUMN
SELECT DEPARTMENT_NAME,D.DEPARTMENT_ID,E.DEPARTMENT_ID AS EMP_DEPT_ID, D.MANAGER_ID AS DEPT_MAANGER_ID,E.MANAGER_ID AS EMP_MANAGER_ID,
EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES E JOIN DEPARTMENTS D 
ON (D.MANAGER_ID = E.MANAGER_ID AND D.DEPARTMENT_ID = E.DEPARTMENT_ID);

-- NATURAL JOIN USING CLAUSE
SELECT * FROM DEPARTMENTS D JOIN EMPLOYEES E ON E.DEPARTMENT_ID = D.DEPARTMENT_ID WHERE E.SALARY > 20000;
SELECT * FROM DEPARTMENTS JOIN EMPLOYEES USING(MANAGER_ID);
-- RIGHT OUTER JOIN
SELECT employee_id, first_name,last_name,department_name FROM DEPARTMENTS  RIGHT OUTER JOIN EMPLOYEES 
ON DEPARTMENTS.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID ORDER BY DEPARTMENT_NAME;
--USING CLAUSE
SELECT employee_id, first_name,last_name,department_name FROM DEPARTMENTS  RIGHT OUTER JOIN EMPLOYEES
USING(DEPARTMENT_ID);
-- WHERE CLAUSE
SELECT employee_id, first_name,last_name,department_name FROM DEPARTMENTS  RIGHT OUTER JOIN EMPLOYEES
USING (DEPARTMENT_ID) WHERE EMPLOYEES.SALARY >15000;

-- LEFT OTUER Jion
SELECT employee_id, first_name,last_name,department_name FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
ON D.department_id = E.department_id;
--USING CLAUSE
SELECT employee_id, first_name,last_name,department_name FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
USING(department_Id);
-- WHERE CLAUSE
SELECT employee_id, first_name,last_name,department_name FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
USING(department_Id) WHERE DEPARTMENT_NAME = 'Purchasing';

-- FULLL OUTER JOIN
SELECT employee_id, first_name,last_name,department_name FROM DEPARTMENTS D FULL OUTER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;
--CREATE USER
CREATE USER SONU IDENTIFIED BY sonu
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
PROFILE DEFAULT
QUOTA UNLIMITED ON USERS
PASSWORD EXPIRE
ACCOUNT UNLOCK;
-- GRANT CREATE SESSION PRIVILAGES
GRANT CREATE SESSION TO SONU;

DROP USER SONU CASCADE;

--
CREATE USER SONU IDENTIFIED BY SHAIKH
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON USERS
PROFILE DEFAULT
PASSWORD EXPIRE
ACCOUNT LOCK;
--
DESCRIBE EMPLOYEES;
SELECT first_name, NVL(salary * COMMISSION_PCT, 0)  FROM employees  WHERE COMMISSION_PCT <> NULL;  

CREATE TABLE EMP_1
(
  --EMP_NAME VARCHAR2(30) NOT NULL,
  EMP_NO NUMBER PRIMARY KEY,
  DOB TIMESTAMP DEFAULT SYSDATE
  --HIRE_DATE DATE CONSTRAINT HIRE_DATE_CHECK CHECK(HIRE_DATE >= SYSDATE)
  );
  
INSERT INTO EMP_1(EMP_NO) VALUES(1);
SELECT * FROM EMP_1;

-- GROUP BY CLAUSE
SELECT DEPARTMENTS.DEPARTMENT_NAME,MAX(SALARY) AS HIGHEST_PAID FROM EMPLOYEES RIGHT OUTER JOIN DEPARTMENTS USING(DEPARTMENT_ID) 
GROUP BY DEPARTMENTS.DEPARTMENT_NAME ORDER BY 2 DESC NULLS LAST;
-- NOT WORKING QUERY
SELECT FIRST_NAME,SALARY,DEPARTMENTS.DEPARTMENT_NAME FROM EMPLOYEES JOIN DEPARTMENTS USING(DEPARTMENT_ID)
GROUP BY DEPARTMENTS.DEPARTMENT_NAME HAVING SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES GROUP BY EMPLOYEE_ID);
--NULL
SELECT FIRST_NAME,SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID IS NULL;
-- GROUP BY CLAUSE
SELECT TRUNC(AVG(MAX(SALARY)),.00) AS AVG_OF_MAX_SAL FROM EMPLOYEES GROUP BY DEPARTMENT_ID;
-- HOW TO GET MAX SALARY WITH RESPECT TO DEPARTMENT ALONG WITH EMPLOYEE NAME
SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID);

SELECT  DEPARTMENT_ID, MAX(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID;













