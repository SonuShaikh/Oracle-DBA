-- RECORD IN ORACLE
--TABLE BASE RECORD
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE pr_records 
IS
    var_emp HR.employees%ROWTYPE;
BEGIN
    SELECT * INTO var_emp FROM HR.employees WHERE  employee_id = 100;
    
    DBMS_OUTPUT.PUT_LINE(var_emp.first_name ||' '|| var_emp.last_name ||' has salary '||var_emp.salary);
    
END pr_records;
/
EXECUTE pr_records;

--
SET SERVEROUTPUT ON;
DECLARE
  v_emp HR.employees%ROWTYPE;
BEGIN
  SELECT * INTO v_emp FROM HR.employees
  WHERE employee_id = 100;
          DBMS_OUTPUT.PUT_LINE (v_emp.first_name ||' '||v_emp.salary);
  DBMS_OUTPUT.PUT_LINE(v_emp.hire_date);
END;
/


-- User defin record
DECLARE
    TYPE var_emp IS RECORD
    (
        emp_name VARCHAR2,
        emp_salary NUMBER
    );
    
BEGIN
    SELECT first_name, salary INTO var_emp.emp_name, var_emp.emp_salary FROM HR.employees WHERE employee_id =100;
    
    DBMS_OUTPUT.PUT_LINE(var_emp.emp_name ||' '|| var_emp.emp_salary);
END pr_userRecord;
/
    
-- Object Creations (Below Code is not working)
desc sales_demo;
CREATE OR REPLACE TYPE sales_rows AS OBJECT (
        prod_id NUMBER,
        cust_id NUMBER ,
        time_id DATE,
        amount_sold NUMBER(10,2) 
);
/

CREATE OR REPLACE TYPE sales_table IS TABLE OF SH.sales%ROWTYPE;
/
--Example Sales Table
CREATE OR REPLACE FUNCTION fn_fetchSalestable(p_custId NUMBER)
RETURN sales_rows
IS
    var_sr sales_rows := sales_rows();
BEGIN
    FOR indx IN (select prod_id,cust_Id,time_id,amount_sold FROM SH.sales WHERE cust_id = p_custId)
    LOOP
        var_sr.EXTEND;
        var_sr(var_sr.LAST) := sales_rows(indx.prod_id,indx.cust_id,indx.time_id,indx.amount_sold);
    END LOOP;
    
    RETURN var_sr;
    
END;
/
    
select prod_id,cust_Id,time_id,amount_sold FROM SH.sales WHERE cust_id = 2; -- p_custId;
    
    
        
        
        
        
        
        
        
        
        
        
        