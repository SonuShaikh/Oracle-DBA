CREATE TABLE test 
(
  col1 VARCHAR2(20)
  );
  
  DESC TEST;
  ALTER TABLE test RENAME COLUMN col1 TO test_id;
  DESC TEST;
  ALTER TABLE test MODIFY test_id NUMBER(2);
  DESC TEST;
  
  -- NATURAL JOINS
  DESC EMPLOYEES;
  DESC DEPARTMENTS;
  SELECT * FROM EMPLOYEES;
  SELECT * FROM DEPARTMENTS;
  --FIRST SCENARIO USING NATURAL JOIN CLAUSE
  SELECT first_name,department_id from employees NATURAL JOIN departments;
  
  --SECOND SCENARIO USING USING CLAUSE
  SELECT first_name,department_name from employees  JOIN departments USING(manager_id);
  
    --THIRD SCENARIO USING USING ON CLAUSE
  SELECT first_name,department_name FROM employees emp join departments dpt 
  ON (emp.manager_id = dpt.manager_id AND emp.department_id = dpt.department_id); 
  
  
  -- RIGHT OUTER JOIN
  CREATE TABLE emp 
  (
     emp_id NUMBER(2),
     emp_name VARCHAR2(20),
     emp_salary NUMBER(10),
     CONSTRAINT emp_eid_pk PRIMARY KEY(emp_id)
     );
 

 DROP TABLE dept_emp;
 CREATE TABLE dept_emp (
    dept_id NUMBER(2) CONSTRAINT primary_key PRIMARY KEY,
    dept_name VARCHAR2(10),
    emp_id CONSTRAINT FOREIGN_KEY REFERENCES emp(emp_id)
    );
    ALTER TABLE dept ADD CONSTRAINT dept_empid_fk FOREIGN KEY(emp_id) REFERENCES emp(emp_id);
 
 
 INSERT INTO emp VALUES(1,'sonu',5000);
 INSERT INTO emp VALUES(2,'salman',5000);
 INSERT INTO emp VALUES(3,'sahil',5000);
 INSERT INTO emp VALUES(4,'shaikh',5000);
 INSERT INTO emp VALUES(5,'anita',5000);
 
 
 INSERT INTO dept VALUES (1,'Marketing',1);
 INSERT INTO dept VALUES (2,'It',2);
 INSERT INTO dept VALUES (3,'Const',3);
 INSERT INTO dept (dept_id,dept_name) VALUES (4,'Finance');
 INSERT INTO dept(dept_id,dept_name) VALUES (5,'HR');
 
 
-- QUIRY ONE
SELECT emp_name,dept_name FROM dept RIGHT OUTER JOIN emp ON (emp.emp_id = dept.emp_id);

SELECT emp_name,dept_name FROM dept LEFT JOIN emp USING(emp_id);--ON  (emp.emp_id = dept.emp_id);
 
 SELECT emp_name,dept_name FROM dept FULL OUTER JOIN emp USING(emp_id);
 
 SELECT emp_name,dept_name FROM dept FULL OUTER JOIN emp ON (emp.emp_id = dept.dept_id);
 
 -- INNER JOIN
 SELECT emp_name,dept_name FROM dept INNER JOIN emp ON (emp.emp_id = dept.emp_id);
 
 -- CROSS JOIN
 SELECT emp_name,dept_name FROM dept CROSS JOIN emp;
 
 SELECT emp_name,dept_name FROM dept , emp;
 
 
  
  