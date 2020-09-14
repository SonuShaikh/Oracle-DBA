-- EXPLICIT CURSOR
SET SERVEROUTPUT ON;
DECLARE
  v_name VARCHAR2(30);
  CURSOR cr_explicit1 IS 
    SELECT first_name FROM employees WHERE employee_id > 105;
BEGIN
   OPEN cr_explicit1;
     LOOP 
         FETCH cr_explicit1 INTO v_name;
         DBMS_OUTPUT.PUT_LINE(v_name);
         EXIT WHEN cr_explicit1%NOTFOUND;
     END LOOP;
   CLOSE cr_explicit1;
END;
/

-- CURSOR PARAMETERS
DECLARE
   v_first_name VARCHAR2(30);
   v_lname VARCHAR2(30);
   CURSOR cr_parameter(var_emp_id VARCHAR2) IS
    SELECT first_name,last_name FROM employees WHERE employee_id = var_emp_id;
BEGIN
   OPEN cr_parameter(100);
     LOOP
       FETCH cr_parameter INTO v_first_name,v_lname;
       EXIT WHEN cr_parameter%NOTFOUND;
       DBMS_OUTPUT.PUT_LINE(v_first_name||' '||v_lname);
    END LOOP;
   CLOSE cr_parameter;
END;
/
-- PARAMETERIZE CURSOR WITH DEFAULT VALUE
DECLARE
   v_name VARCHAR2(30);
   v_id   NUMBER;
   CURSOR cr_param_df(var_id NUMBER := 190) IS
     SELECT first_name,employee_Id FROM employees WHERE employee_id > var_id;
BEGIN
   OPEN cr_param_df(200);
     LOOP
       FETCH cr_param_df INTO v_name,v_id;
       EXIT WHEN cr_param_df%NOTFOUND;
       DBMS_OUTPUT.PUT_LINE(v_name||' '||v_id);
     END LOOP;
  CLOSE cr_param_df;
END;
/

-- CURSOR FOR LOOP
DECLARE
   CURSOR cr_forloop IS 
     SELECT first_name,last_name FROM employees WHERE employee_id >200;
BEGIN
   FOR L_IXD IN cr_forloop LOOP
      DBMS_OUTPUT.PUT_LINE(L_IXD.first_name||' '||L_IXD.last_name);
   END LOOP;
END;
/

-- CURSOR FOR LOOP WITH PARAMETERIZE CURSOR
DECLARE
   CURSOR cr_forloop_param(var_id NUMBER) IS
    SELECT first_name,last_name FROM employees WHERE employee_id > var_id;
BEGIN
   FOR L_IXD IN cr_forloop_param(207) LOOP
     DBMS_OUTPUT.PUT_LINE(L_IXD.first_name||' '||L_IXD.last_name);
   END LOOP;
END;
/
-- 
DECLARE
  CURSOR cr_forloop(var_salary NUMBER) IS 
     SELECT first_name,salary FROM employees WHERE
      salary > var_salary;
BEGIN
   FOR idx IN cr_forloop(9000) LOOP
     DBMS_OUTPUT.PUT_LINE(idx.first_name||' '||idx.salary);
   END LOOP;
END;
/

SELECT * FROM SYSTEM.ddl_audit_data;