-- EXPLICIT CUROSE with single column value
SET SERVEROUTPUT ON;
DECLARE
    v_name HR.employees.first_name%TYPE;
--    v_salary HR.employees.salary%TYPE;

    CURSOR cur_emp IS
        SELECT first_name FROM HR.employees
        WHERE employee_id < 105;
        
 BEGIN
        OPEN cur_emp;
        LOOP 
            FETCH cur_emp INTO v_name;
            DBMS_OUTPUT.PUT_LINE('Employee Name - '|| v_name);
        EXIT WHEN cur_emp%NOTFOUND;
        END LOOP;
        CLOSE cur_emp;
END;
/

-- PARAMETERIZED EMPLICIT CURSOR
DECLARE
    v_salary HR.employees.salary%TYPE;

    CURSOR cur_emp (var_emp_id NUMBER := 190) IS -- have given the default values incase we forgot provide parameter while opening it
    SELECT salary FROM HR.employees
    WHERE employee_id > var_emp_id 
    ORDER BY salary;
    
BEGIN
    OPEN cur_emp(107);
    
    LOOP 
        FETCH cur_emp INTO v_salary;
        DBMS_OUTPUT.PUT_LINE(v_salary);
        EXIT WHEN cur_emp%NOTFOUND;
    END LOOP;
    
    CLOSE cur_emp;
END;
/
/*
Select first_name, salary from hr.employees
    where salary >=(select max(salary) from hr.employees
    where salary < (select max(salary) from hr.employees
    where salary < (select max(salary) from hr.employees))); */
    
-- CURSOR WITH RECORD VARIABLE
CREATE OR REPLACE PROCEDURE pr_max3Salary IS
    CURSOR emp_sal IS
    SELECT first_name,employee_id,salary FROM HR.employees
    WHERE ROWNUM <= 3
    ORDER BY salary;
    
    -- cursor type recored variable 
    crv_emp emp_sal%ROWTYPE;
    
BEGIN
    OPEN emp_sal;
    LOOP
        FETCH emp_sal INTO crv_emp;
        DBMS_OUTPUT.PUT_LINE('`'||crv_emp.first_name||'` has salary `'||crv_emp.salary||'`');
        EXIT WHEN emp_sal%NOTFOUND;
    END LOOP;
    CLOSE emp_sal;
END;
/

EXEC pr_max3salary;

--CURSOR FOR LOOP
-- simple CURSOR FOR loop
DECLARE
    CURSOR cur_emp IS
        SELECT employee_Id, salary from HR.EMPLOYEES 
        WHERE SALARY BETWEEN 10000 AND 24000;
BEGIN
    FOR indx IN cur_emp LOOP
        DBMS_OUTPUT.PUT_LINE(indx.employee_id||' - '||indx.salary);
    END LOOP;
END;
/


--CURSOR FOR LOOP WITH INLINE CURSOR
BEGIN
    FOR indx IN (SELECT * FROM HR.employees WHERE department_id = 90) LOOP
        DBMS_OUTPUT.PUT_LINE(indx.employee_id||' '||indx.first_name||' '||indx.email);
    END LOOP;
END;
/

--Write a procedure to fetch data from table SALES for a given parameter sales date and display all the data
SELECT * FROM SH.sales;
SELECT DISTINCT(time_id), count(time_id) FROM SH.sales GROUP BY time_Id; 

SELECT prod_id, cust_id, amount_sold FROM SH.sales
    WHERE time_id ='02-JAN-98';


CREATE OR REPLACE PROCEDURE pr_saleOn 
IS
    CURSOR cur_sale IS  --  (sale_date NUMBER :=TO_DATE('02-JAN-98','DD-JAN-YY') )
    SELECT prod_id, cust_id, amount_sold FROM SH.sales
    WHERE time_id = '02-JAN-98';

    crv_sale cur_sale%ROWTYPE;

BEGIN

    OPEN cur_sale; --(TO_DATE('01-JAN-98','DD-JAN-YY'));
    DBMS_OUTPUT.PUT_LINE('PRODUCT_iD CUSTOMER ID AMOUNT SOULD');
    LOOP 
        FETCH cur_sale INTO crv_sale;
        DBMS_OUTPUT.PUT_LINE(crv_sale.prod_id||' -- '||crv_sale.cust_id||' --'||crv_sale.amount_sold);
        EXIT WHEN cur_sale%NOTFOUND;
    END LOOP;
    CLOSE cur_sale;
END pr_saleOn;
/
EXEC pr_saleOn;
















