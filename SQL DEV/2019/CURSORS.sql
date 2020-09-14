-- BASIC CURSOR
DESCRIBE HR.EMPLOYEES;
DECLARE
    v_firstname HR.EMPLOYEES.first_name%TYPE;
    --CURSOR DECLARATION
    CURSOR cur_rebell IS
        SELECT FIRST_NAME FROM HR.EMPLOYEES WHERE EMPLOYEE_ID < 105;
BEGIN
    OPEN cur_rebell; -- openig the cursor
    LOOP
        FETCH cur_rebell INTO v_firstname;
        DBMS_OUTPUT.PUT_LINE(v_firstname);
        EXIT WHEN cur_rebell%NOTFOUND;
    END LOOP;
    CLOSE cur_rebell;
END;
/

SELECT FIRST_NAME,JOB_ID,SALARY FROM HR.EMPLOYEES WHERE JOB_ID = 'IT_PROG';
UPDATE HR.EMPLOYEES SET SALARY = 2500 WHERE JOB_ID = 'IT_PROG';
-- CURSOR EXAMPLE 2
DECLARE
    fname     hr.employees.first_name%TYPE;
    lname     hr.employees.last_name%TYPE;
    esalary   hr.employees.salary%TYPE;
    CURSOR cur_salary IS SELECT
        first_name,
        last_name,
        salary
                         FROM
        hr.employees
                         WHERE
        salary <= 2500;

BEGIN
    OPEN cur_salary;
    LOOP
        FETCH cur_salary INTO fname,lname,esalary;
        dbms_output.put_line('Mr.'
        || fname
        || ' '
        || lname
        || ' Makes '
        || esalary
        || ' Repees In Month.');

        EXIT WHEN cur_salary%notfound;
    END LOOP;

    CLOSE cur_salary;
END;
/
-- PARAMETERIZED CURSOR
DECLARE
    v_empid HR.EMPLOYEES.employee_id%TYPE;
    CURSOR cur_empid(esalary NUMBER) IS
        SELECT EMPLOYEE_ID FROM HR.EMPLOYEES WHERE SALARY < esalary ORDER BY EMPLOYEE_ID DESC;
BEGIN
    OPEN cur_empid(5000);
    LOOP
        FETCH cur_empid INTO v_empid;
        DBMS_OUTPUT.PUT_LINE(v_empid);
        EXIT WHEN cur_empid%NOTFOUND;
    END LOOP;
    CLOSE cur_empid;
END;
/
-- CURSOR PARAMETER WITH DEFAULT VALUE
DECLARE 
    v_name VARCHAR2(30);
    v_eid  VARCHAR2(30);
    CURSOR cur_rebellionrider( var_e_id NUMBER := 190) IS
        SELECT first_name,employee_id FROM HR.EMPLOYEES WHERE employee_id > var_e_id;
BEGIN
    OPEN cur_rebellionrider(130);
    LOOP
        FETCH cur_rebellionrider INTO v_name,v_eid;
        DBMS_OUTPUT.PUT_LINE(v_name||' '||v_eiD);
        EXIT WHEN cur_rebellionrider%NOTFOUND;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('TOTAL ROWS AFFECTED '||cur_rebellionrider%ROWCOUNT);
    CLOSE cur_rebellionrider;
END;
/
-- CURSOR LOOP
DECLARE 
    v_fname VARCHAR2(30);   
    v_lname VARCHAR2(30);    
    CURSOR cur_forloop IS
        SELECT FIRST_NAME,LAST_NAME FROM HR.EMPLOYEES WHERE employee_id >190;
BEGIN
    FOR L_IND IN cur_forloop LOOP
        DBMS_OUTPUT.PUT_LINE(L_IND.first_name||' '||L_IND.last_name);
    END LOOP;
END;
/
COMMIT;
    
