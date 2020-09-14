-- PLSQL
SELECT * FROM OE.CUSTOMERS;
SELECT * FROM OE.WAREHOUSES;
SELECT * FROM OE.ORDER_ITEMS;
SELECT COUNT(ORDER_ID) FROM OE.ORDER_ITEMS;
SELECT * FROM OE.ORDERS;
SELECT * FROM SH.SALES;
SELECT COUNT(PROD_ID) FROM SH.SALES;
SELECT * FROM OE.INVENTORIES;
SELECT * FROM OE.JOBS;
SELECT * FROM OE.PRODUCT_INFORMATION;
SELECT * FROM OE.PRODUCT_DESCRIPTIONS;
SELECT COUNT(PRODUCT_ID) FROM OE.PRODUCT_DESCRIPTIONS;


-- PL/SQL BLOCK AND VARIABLE
SET SERVEROUTPUT ON;

DECLARE
    v_name  VARCHAR2(30) := 'SONU SHAIKH';
    v_age      CONSTANT VARCHAR2(10)  := 'MALE';
    
BEGIN
    
        DBMS_OUTPUT.PUT_LINE(v_name);
        DBMS_OUTPUT.PUT_LINE(v_age);
        
END;
/   
        
-- BIND VARIABLE
-- DECLARE BIND VARIABLE

VARIABLE v_bind1 VARCHAR2(30) ;

-- INITIALIZATION

EXECUTE :v_bind1 := 'This is bind variable';

--DISPLAY VARIBLE 

PRINT :v_bind1;

BEGIN 
   DBMS_OUTPUT.PUT_LINE( :v_bind1);
END
/

--- Write a program to declare 3 variables with datatype as below and display their values.
SET SERVEROUTPUT ON;
DECLARE
  v_name VARCHAR2(30) := 'SONU SHAIKH';
  v_age NUMBER(3) := 23;
 v_avl_date DATE := TO_DATE('12-JUN-20','DD-MON-YY');
  
  BEGIN
    DBMS_OUTPUT.PUT_LINE(v_name);
    DBMS_OUTPUT.PUT_LINE(v_age);
    DBMS_OUTPUT.PUT_LINE(v_avl_date);
END;
/
        
        
--Write a program to check for a salary value and display the output based on the salary range (use IF condition)
select max(salary) from hr.employees;
DECLARE
    v_name VARCHAR2(30);
    v_salary NUMBER(7,2);
BEGIN
    SELECT first_name, salary INTO v_name, v_salary FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = 200;
    --DBMS_OUTPUT.PUT_LINE(v_name||' '||v_salary);
    IF v_salary > 20000 THEN
        DBMS_OUTPUT.PUT_LINE(v_name ||' is - A grade employee'); 
    ELSIF v_salary > 15000 THEN
        DBMS_OUTPUT.PUT_LINE(v_name ||' is - B grade employee'); 
    ELSIF v_salary > 10000 THEN
         DBMS_OUTPUT.PUT_LINE(v_name ||' is - C grade employee'); 
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_name ||' is - D grade employee'); 
END IF;
END;
/

--  USING CASE STATEMENT

   
    SELECT FIRST_NAME, SALARY
    (CASE SALARY
     
     WHEN SALARY > 20000 THEN 'A GRADE EMPLOYEE'
     WHEN SALARY > 15000 THEN  'B GRADE EMPLOYEE'
     WHEN SALARY > 10000 THEN 'C GRADE EMPLOYEE'
     ELSE 'D GRADE EMPLOYEE'
    
    END CASE) AS GRADE 
    
    FROM HR.EMPLOYEES WHERE EMPLOYEE_iD = 100;
    
--Write a program to display values from 200 to 300 using a WHILE loop.

DECLARE
  v_counter NUMBER(3) :=200;
  
BEGIN

    WHILE v_counter <= 300 LOOP 
        DBMS_OUTPUT.PUT_LINE(v_counter);
        v_counter := v_counter + 1;
    END LOOP;
   
END;
/
    
-- Write a program to display values from 200 to 300 using a FOR loop
BEGIN
    FOR v_counter IN 200..300 LOOP 
        DBMS_OUTPUT.PUT_LINE(v_counter);
    END LOOP;
END;
/
    
    
    
    
    
    
    
    