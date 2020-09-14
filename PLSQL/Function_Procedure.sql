-- INTRODUCTION TO FUNCTION AND PROCEDURE

--Write a procedure to fetch data from table SALES for a given parameter orderid and display the data.
SELECT * FROM SH.SALES;
SELECT * FROM HR.EMPLOYEES;

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE pr_emp_sal (emp_id NUMBER)
IS() 
    v_salary hr.employees.salary%TYPE;
BEGIN
    SELECT salary INTO v_salary FROM HR.employees WHERE employee_id = emp_id;
    dbms_output.put_line ('SALARY OF EMPLOYEE IS '|| v_salary);
END  pr_emp_sal;
/

EXECUTE pr_emp_sal(100);]

-- FUCNTION
CREATE OR REPLACE FUNCTION cirle_area (radius NUMBER) 
RETURN NUMBER IS
     v_pi CONSTANT NUMBER :=3.14;
     v_area NUMBER (7,2);
BEGIN
    v_area := v_pi * (radius * radius);
    RETURN v_area;
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(cirle_area(10));
END;
/









    






