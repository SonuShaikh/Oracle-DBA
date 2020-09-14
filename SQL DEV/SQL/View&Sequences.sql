--VIEW
-- CREATING A SIMPLE VIEWS
CREATE VIEW vw_emp AS
 select first_name,last_name,salary FROM HR.employees;
 SELECT * FROM vw_emp;
 -- ALTERING A VIEW
 CREATE OR REPLACE VIEW vw_emp AS
     select first_name , last_name , salary FROM HR.EMPLOYEES WHERE salary BETWEEN 9000 AND 10000;
  SELECT * FROM vw_emp;
  -- DELETING CONTENT FROM VIEW 
  DELETE FROM vw_emp WHERE first_name = 'Tayler';
  -- Inserting data to views
  INSERT INTO vw_emp (first_name,last_name,salary) VALUES ('Sonu','Shaikh',10000);
  -- Droppin View
  DROP VIEW vw_emp;
  
  -- SEQUENCES IN 
  -- Creating a Sequence
  CREATE SEQUENCE sq_demo 
  START WITH 0
  INCREMENT BY 1
  MAXVALUE 10
  MINVALUE 0
  CYCLE
  ORDER
  CACHE 3; 
  -- Create a default sequenc
  CREATE SEQUENCE sq_demo1;
  
  -- Initialize the sequence
  SELECT sq_demo.nextval FROM dual;
  -- How to get current value of the sequence
  SELECT sq_demo.currval FROM dual;
  -- How to use the sequence
  
  CREATE TABLE demo
  (
     Roll_no NUMBER,
     name VARCHAR2(20)
     );
 
   INSERT INTO demo VALUES (sq_demo.nextval,'&name');
  ALTER TABLE DEMO ADD CONSTRAINT drno_pk PRIMARY KEY (roll_no);
  
 -- How to Drop sequence
 DROP SEQUENCE sq_demo1;