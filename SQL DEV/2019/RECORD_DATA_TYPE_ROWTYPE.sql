-- RECORD DATA TYPE
SET SERVEROUTPUT ON;
DECLARE
    V_EMP HR.EMPLOYEES%ROWTYPE;
BEGIN
    SELECT * INTO V_EMP FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = 200;
    DBMS_OUTPUT.PUT_LINE(V_EMP.first_name||' '||V_EMP.salary);
    DBMS_OUTPUT.PUT_LINE(V_EMP.hire_date);
END;
/
--SELECT LIMITED COLUMN DATA
DECLARE
    v_emp HR.EMPLOYEES%ROWTYPE;
BEGIN
    SELECT first_name,hire_date INTO v_emp.first_name,v_emp.hire_date FROM HR.EMPLOYEES WHERE employee_id = 100;
    DBMS_OUTPUT.PUT_LINE(v_emp.first_name);
    DBMS_OUTPUT.PUT_LINE(v_emp.hire_date);
END;
/
--CURSOR BASED RECORD DATA TYPE(HANDLING SINGLE RECORD)
DECLARE
    CURSOR cur_RebellionRider IS
    SELECT first_name,last_name,job_id FROM HR.EMPLOYEES WHERE employee_id = 100;
    
    var_emp cur_RebellionRider%ROWTYPE;
BEGIN
    OPEN cur_RebellionRider;
    FETCH cur_RebellionRider INTO var_emp;
        DBMS_OUTPUT.PUT_LINE('`FIRST NAME` '||var_emp.first_name);
        DBMS_OUTPUT.PUT_LINE('`Last Name` '||var_emp.last_name);
        DBMS_OUTPUT.PUT_LINE('`JOB ID` '||var_emp.job_id);
    CLOSE cur_RebellionRider;
END;
/
    
-- CURSOR BASED RECORD DATA TYPE (HANDLING MULTIPLE ROW DATA)
DECLARE
    CURSOR cur_rowtype IS
        SELECT employee_id,first_name,salary FROM HR.EMPLOYEES WHERE employee_id >200;
    
    var_emp cur_rowtype%ROWTYPE;
BEGIN
    OPEN cur_rowtype;
        LOOP
            FETCH cur_rowtype INTO var_emp;
            EXIT WHEN cur_rowtype%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(var_emp.employee_id||' '||var_emp.first_name||' '||var_emp.salary);
        END LOOP;
    CLOSE cur_rowtype;
END;
/

-- CURSOR FOR LOOP -- 'CODE IS NOT WORKING.'
DECLARE
    CURSOR cur_rowtype IS
        SELECT first_name,salary FROM HR.EMPLOYEES WHERE employee_id > 200;
    var_emp cur_rowtype%ROWTYPE;
BEGIN
        FOR cur_idx IN cur_rowtype LOOP
           FETCH cur_rowtype INTO var_emp;
           DBMS_OUTPUT.PUT_LINE(var_emp.first_name||' '||var_emp.salary);
        END LOOP;
END;
/

SET SERVEROUTPUT ON;
-- USER DEFINE CURSOR;
DECLARE
    TYPE rv_dept IS RECORD(
     fname VARCHAR2(30),
     dname HR.DEPARTMENTS.department_name%TYPE
     );
    
    var1 rv_dept;
BEGIN
    
    SELECT first_name,department_name INTO var1.fname,var1.dname FROM HR.EMPLOYEES JOIN HR.DEPARTMENTS
    USING(department_Id)
    WHERE employee_id = 100;
    
    DBMS_OUTPUT.PUT_LINE(var1.fname||' '||var1.dname);
END;
/





















