-- INTRODUCTION TO RECORD
-- type 1 TABLE BASED RECORD
SET SERVEROUTPUT ON;
DECLARE
  v_emp employees%ROWTYPE;
BEGIN
   SELECT * INTO v_emp FROM employees WHERE employee_Id = 200;
   DBMS_OUTPUT.PUT_LINE(v_emp.first_name||' '||v_emp.salary);
END;
/
-- TABLE BASED RECORD PART 2 SELECTED COLUMS
DECLARE
  v_emp employees%ROWTYPE;
BEGIN
   SELECT first_name , hire_date INTO v_emp.first_name,v_emp.hire_date FROM employees WHERE employee_Id = 200;
   DBMS_OUTPUT.PUT_LINE(v_emp.first_name);
   DBMS_OUTPUT.PUT_LINE(v_emp.hire_date);
END;
/
-- TYPE 2 RECORD
-- CURSOR BASE RECORD TYPE VARIABLE
DECLARE
  CURSOR cur_pnd IS 
   SELECT first_name,salary FROM employees WHERE employee_id = 200;
   
   v_emp cur_pnd%ROWTYPE;
BEGIN
   OPEN cur_pnd;
   FETCH cur_pnd INTO v_emp;
   DBMS_OUTPUT.PUT_LINE(v_emp.first_name);
   DBMS_OUTPUT.PUT_LINE(v_emp.salary);
   CLOSE cur_pnd;
END;
/

-- CURSOR BASED RECORD TYPE MULTIPLE VALUES
DECLARE
  CURSOR cur_pnd IS
     SELECT first_name,salary,hire_date FROM employees WHERE employee_id > 200;
     
     v_emp cur_pnd%ROWTYPE;
BEGIN
   OPEN cur_pnd;
   LOOP 
      FETCH cur_pnd INTO v_emp;
       EXIT WHEN cur_pnd%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(v_emp.first_name||' '||v_emp.salary||' '||v_emp.hire_date);
   END LOOP;
   CLOSE cur_pnd;
END;
/
-- TYPE3 RECORD
-- USER DEFINED RECORD 
DECLARE
  TYPE rv_dept IS RECORD(
     fname VARCHAR2(30),
     dept_name DEPARTMENTS.department_name%TYPE
  );
  var1 rv_dept;
BEGIN
   SELECT first_name,department_name INTO var1.fname,var1.dept_name 
   FROM employees JOIN departments USING(department_Id) WHERE employee_id = 100;
   DBMS_OUTPUT.PUT_LINE(var1.fname||' is working in `'||var1.dept_name||'` Deparment ');
END;
/
 -- EXAMPLE 2
 DECLARE
    TYPE ud_rec IS RECORD(
       first_name EMPLOYEES.first_name%TYPE,
       salary EMPLOYEES.salary%TYPE,
       dept_name DEPARTMENTS.department_name%TYPE,
       emp_id EMPLOYEES.employee_id%TYPE
       );
       
       var1 ud_rec;
BEGIN
    SELECT first_name,salary,employee_id,department_name INTO var1.first_name,var1.salary,var1.emp_id,var1.dept_name
    FROM employees e JOIN DEPARTMENTS  USING(department_id) WHERE e.employee_Id = 190;
    
   -- LOOP 
       DBMS_OUTPUT.PUT_LINE(var1.first_name||' '||var1.salary||' '||var1.emp_id||' '||var1.dept_name);
     --  EXIT WHEN var1%NOTFOUND;
    --END LOOP;
END;
/