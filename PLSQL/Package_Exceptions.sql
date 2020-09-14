-- PACKAGE IN ORACLE
-- PACKAGE HEADER

CREATE OR REPLACE PACKAGE pck_employees AS
--    FUNCTION fn_dispString  RETURN VARCHAR2;
    PROCEDURE pr_addemp(f_name VARCHAR2, l_name VARCHAR2);
END pck_employees;
/

-- PACKAGE BODY

CREATE OR REPLACE PACKAGE BODY pck_employees IS
/*
FUNCTION fn_despString RETURN VARCHAR2
IS
END fn_despString;

*/
-- EMPLEMENTING PROCEDURE

    PROCEDURE pr_addemp (f_name VARCHAR2, l_name VARCHAR2) IS
    BEGIN
        INSERT INTO superheros VALUES (f_name,l_name);
        DBMS_OUTPUT.PUT_LINE('DATABASE INSERT SUCCESSFULLY');
    END pr_addemp;

END pck_employees;
/


BEGIN
    pck_employees.pr_addemp('sonu','shaikh');
END;
/
SELECT * FROM superheros;


-- EXCEPTION DEMO

CREATE OR REPLACE PROCEDURE sys_exception (emp_id NUMBER)
IS 
    v_salary NUMBER;
    v_name VARCHAR2(30);
BEGIN
    SELECT first_name, salary INTO v_name,v_salary FROM HR.employees;-- WHERE employee_id = emp_id;
    DBMS_OUTPUT.PUT_LINE(v_name ||' '|| v_salary);
    
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('NO RECORDS SELECTED');
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('Too Many records');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR!!!');
END sys_exception;
/

EXECUTE sys_exception(100);
EXECUTE sys_exception(1000);
    
-- USER DEFINE EXCEPTION

CREATE OR REPLACE PROCEDURE pr_division( divident NUMBER, deviser NUMBER)
IS
     v_devident NUMBER := divident;
     v_deviser NUMBER := deviser;
     v_result NUMBER;
     vex_DivZero EXCEPTION;
BEGIN
    
        IF v_deviser = 0 THEN
            RAISE vex_DivZero;
        END IF;
    
        v_result := v_devident / v_deviser;
        DBMS_OUTPUT.PUT_LINE ('RESULT IS '||v_result);
        
        EXCEPTION
            WHEN vex_DivZero THEN
                DBMS_OUTPUT.PUT_LINE('You can not devide by Zero 0');
            WHEN others THEN
                DBMS_OUTPUT.PUT_LINE('ERROR!!!!');
END pr_division;
/

EXECUTE pr_division(100,10);

EXECUTE pr_division(100,0);

EXECUTE pr_division(100,'A');




        
