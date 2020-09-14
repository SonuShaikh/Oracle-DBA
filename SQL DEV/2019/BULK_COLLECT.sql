-- BULCK COLLECT CLAUSE WITH
-- SELECT INTO CLAUSE
SET SERVEROUTPUT ON;
DECLARE
    TYPE fn_type IS TABLE OF VARCHAR2(30);
    fn_var fn_type;
BEGIN
    SELECT first_name,LAST_NAME BULK COLLECT INTO fn_var FROM employees;
    FOR indx IN 1..fn_var.COUNT
    LOOP
        DBMS_OUTPUT.PUT_LINE(indx||' '||fn_var(indx));
    END LOOP;
END;
/
-- BULK COLLECT CLAUSE WITH FETCH INTO CLAUSE
DECLARE
    CURSOR my_cur IS 
        SELECT FIRST_NAME FROM EMPLOYEES;
    TYPE nt_emp IS TABLE OF VARCHAR2(30);
    nt_var nt_emp;
BEGIN
   OPEN my_cur;
   LOOP
     FETCH my_cur BULK COLLECT INTO nt_var; 
        FOR indx IN nt_var.FIRST..nt_var.LAST 
        LOOP
            DBMS_OUTPUT.PUT_LINE(indx||' '||nt_var(indx));
        END LOOP;
     EXIT WHEN my_cur%NOTFOUND;
   END LOOP;   
   CLOSE my_cur;
END;
/
DECLARE
    CURSOR my_cur IS
        SELECT FIRST_NAME FROM employees;
    TYPE obj_typ IS TABLE OF VARCHAR2(30);
    obj obj_typ;
BEGIN
    OPEN my_cur;
    FETCH my_cur BULK COLLECT INTO obj LIMIT 15;   
    CLOSE my_cur;
    
    FOR indx IN 1..obj.COUNT
    LOOP
        DBMS_OUTPUT.PUT_LINE(indx||' '||obj(indx));
    END LOOP;
END;
/
    
-- BULK COLLECT CLAUSE WITH LIMIT CLAUSE

/* CODE IS NOT WORKING
-- HOW TO SELECT MULTIPLE ROW 
CREATE OR REPLACE TYPE emp_obj AS OBJECT(
    obj_fn VARCHAR2(30),
    obj_ln VARCHAR2(30),
    obj_salary NUMBER(7,3)
    );
/

DECLARE
    TYPE emptb  IS TABLE OF emp_obj;
    var1 emptb;
BEGIN
    SELECT FIRST_NAME,LAST_NAME,SALARY INTO var1 FROM EMPLOYEES;
    
    FOR indx IN 1..var1.COUNT
    LOOP
        DBMS_OUTPUT.PUT_LINE(indx||' '||var1.FIRST_NAME(indx));
    END LOOP;
    
END;
/
*/