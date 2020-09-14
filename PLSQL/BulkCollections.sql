-- BULK COLLECTION IN ORACLE
DESC SH.SALES;

CREATE TABLE sales_demo AS SELECT * FROM SH.sales;
SELECT * FROM sales_demo;
ALTER TABLE sales_demo ADD tax_amout NUMBER (7,0);
--BULK COLLECT select into clause

SET SERVEROUT ON;
DECLARE
    TYPE nt_sales IS TABLE OF NUMBER;
    ntSale nt_sales;
BEGIN
        SELECT cust_id BULK COLLECT INTO ntSale FROM sales_demo WHERE ROWNUM <50;
        
        FOR indx IN 1.. ntSale.COUNT LOOP
        
            DBMS_OUTPUT.PUT_LINE(indx||' '||ntSale(indx));
            
        END LOOP;
END;
/

--BULK COLLECT WITH FETCH INTO CLAUSE
DECLARE
    CURSOR cur_sales IS SELECT cust_id FROM sales_demo WHERE ROWNUM < 150;
    
    TYPE nt_sales IS TABLE OF NUMBER;
    ntSale nt_sales;

BEGIN     
    OPEN cur_sales;
    LOOP 
        FETCH cur_sales BULK COLLECT INTO ntSale;
            EXIT WHEN ntSale.COUNT = 0;
            FOR indx IN 1.. ntSale.COUNT LOOP
                DBMS_OUTPUT.PUT_LINE(indx ||' - '||ntSale(indx));
            END LOOP;
    END LOOP;
    CLOSE cur_sales;
END;
/

-- BULK COLLECT CLAUSE WITH LIMIT CLAUSE
DECLARE
    CURSOR cur_emp IS
        SELECT FIRST_NAME FROM HR.employees;
        
    TYPE nt_typ IS TABLE OF VARCHAR2(40);
    ntTbl nt_typ;
    
BEGIN
    OPEN cur_emp;
        FETCH cur_emp BULK COLLECT INTO ntTbl LIMIT 10;
        CLOSE cur_emp;
        FOR indx IN 1.. ntTbl.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE(indx||' - '||ntTbl(indx));
        END LOOP; 
END;
/

--FOR ALL CLAUSE

CREATE TABLE emp_demo (emp_name VARCHAR2(30));

DECLARE
    CURSOR cur_empName IS SELECT first_name FROM HR.employees;
    TYPE nameArray IS TABLE OF VARCHAR2(30) INDEX BY PLS_INTEGER;
    var_name nameArray;
    v_total NUMBER;
BEGIN
        OPEN cur_empName;
        FETCH cur_empName BULK COLLECT INTO var_name;
        CLOSE cur_empName;
        
        DBMS_OUTPUT.PUT_LINE(var_name.COUNT ||' row selected');
        
        FORALL indx IN 1.. var_name.COUNT
            INSERT INTO emp_demo (emp_name) VALUES (var_name(indx));
          
          DBMS_OUTPUT.PUT_LINE('DATA INSERTED');
          
        --    SELECT COUNT(emp_name) INTO v_total FROM emp_demo;
          --  DBMS_OUTPUT.PUT_LINE( v_total || - 'ROW INSERTED');
          
END;
/
--FORLL CLAUSE WITH INDICES OF OPTION
CREATE TABLE dempNum (col1 NUMBER);
DECLARE
    TYPE nt_tbl IS TABLE OF NUMBER;
    ntTbl nt_tbl := nt_tbl(9,18,36,45,5463,72,81,90);
BEGIN
    ntTbl.DELETE(3,6);
    FOR indx IN 1.. ntTbl.LAST LOOP
    
           IF ntTbl.EXISTS(indx) THEN
                 DBMS_OUTPUT.PUT_LINE(ntTbl(indx));
            ELSE
                 DBMS_OUTPUT.PUT_LINE('no data at index '||indx);
            END IF; 
            
        FORALL indx IN INDICES OF ntTbl
            INSERT INTO dempNum VALUES (ntTbl(indx));
            
    END LOOP;
END;
/

-- FORALL WITH VALUES-OF clause
DECLARE
    TYPE nt_tbl IS TABLE OF NUMBER;
    ntTbl nt_tbl := nt_tbl(8,16,24,32,40,48,56,64,72,80);
    
    TYPE my_array IS TABLE OF BINARY_INTEGER INDEX BY BINARY_INTEGER;
    indx_array my_array;
BEGIN
    indx_array (1) := 3;
    indx_array (8) := 6;
    indx_array (16) := 7;
    indx_array (32) := 8;    
    indx_array (90) := 10;
    
    FORALL indx IN VALUES OF indx_array
        INSERT INTO dempNum(col1) VALUES (ntTbl(indx));
        DBMS_OUTPUT.PUT_LINE('Data Inserted Successfully!');    
END;
/
SELECT * FROM dempNum;

--***  EXERCISE ***
--CREATE THE PROCEDURE TO UPDATE THE TAX FOR ELIGIBLE ELIGIBLE ORDER ID
CREATE TABLE sales(
    cust_id NUMBER,
    total_purchase NUMBER(9,2),
    total_amout_incltax NUMBER(9,2)
);

INSERT INTO sales(cust_id,total_purchase)  
    SELECT cust_id, SUM(amount_sold) AS total_purchase FROM sales_demo  
        GROUP BY cust_Id 
        HAVING SUM(amount_sold) > 10000 
        ORDER BY cust_id;


--FUNCTION to check eligibility amout for tax
select sum(amount_sold) from sales_demo WHERE cust_id = 2;

CREATE OR REPLACE FUNCTION fn_eligibleAmount(p_cust_id NUMBER) 
RETURN BOOLEAN
IS
    total_amount NUMBER;
BEGIN
    SELECT SUM(amount_sold) INTO total_amount FROM sales_demo
    WHERE cust_id = p_cust_id;
    
    IF total_amount > 10000 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
/


--STORED PROCEDURE to update tax amount for eligible amount
CREATE OR REPLACE PROCEDURE pr_taxUpdate(p_taxRate NUMBER) 
AS
    l_eligible BOOLEAN;
    TYPE customer_ids IS TABLE OF sales_demo.cust_id%TYPE INDEX BY PLS_INTEGER; -- associative array
    cust_id customer_ids;
    eligible_cust_id customer_ids;
    
BEGIN
    SELECT DISTINCT cust_id BULK COLLECT INTO cust_id FROM sales_demo;
   -- DBMS_OUTPUT.PUT_LINE(cust_id.COUNT);
   
    FOR indx IN 1.. cust_id.COUNT LOOP
    
       l_eligible := fn_eligibleAmount(cust_id(indx));
    
        IF l_eligible THEN
            eligible_cust_id (eligible_cust_id.COUNT +1) := cust_id(indx);
            --DBMS_OUTPUT.PUT_LINE(cust_id(indx)||' inserted');
            l_eligible := FALSE;
        END IF;
    END LOOP;
    
   FORALL indx IN 1.. eligible_cust_id.COUNT 
        UPDATE sales S
        SET S.total_amout_incltax  = S. total_purchase + (S.total_purchase * p_taxRate / 100) 
        WHERE S.cust_id = eligible_cust_id(indx);  
END;
/

EXECUTE pr_taxUpdate(0.3);

SELECT * FROM SALES;

DROP TABLE SALES;

SELECT owner, TABLE_NAME FROM ALL_TABLES WHERE TABLESPACE_NAME = 'USERS';


-- BULK COLLECT WITH EXCEPTION TYPE

CREATE TABLE sales_demo AS SELECT prod_Id,cust_id, time_id, amount_sold FROM SH.SALES;

SELECT * FROM sales_demo;
DELETE FROM sales_demo;
ALTER TABLE sales_demo MODIFY cust_id NUMBER  CONSTRAINT contraint_pk_custid PRIMARY KEY;

-- procedure to insert data into sales table and catch erros
CREATE OR REPLACE PROCEDURE pr_insertSalesdata
AS
    CURSOR cur_sales IS 
        SELECT prod_id,cust_Id,time_id,amount_sold FROM SH.sales;
    
        TYPE ty_sales IS TABLE OF SH.sales%ROWTYPE;
        var_sale type_sales;
        
BEGIN
    OPEN cur_sales;
    LOOP
        FETCH cur_sales BULK COLLECT INTO var_sale LIMIT 1000;
        FORALL indx IN 1.. var_sale.COUNT SAVE EXCEPTIONS -- SAVE EXCEPTION
            INSERT INTO sales_demo (prod_id,cust_Id,time_id,amount_sold) VALUES (var_sale(indx));
            
            EXIT WHEN cur_sale%NOTFOUND;
    END LOOP;
    
    CLOSE cur_sales;
    
    EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -24381 THEN
                FOR indx IN 1.. SQL%BULK_EXCEPTIONS.COUNT LOOP
                    DBMS_OUTPUT.PUT_LINE(SQL%BULK_EXCEPTION(indx).ERROR_INDEX);
                    DBMS_OUTPUT.PUT_LINE(SQL%BULK_EXCEPTION(indx).ERROR_CODE);
                END LOOP;
            ELSE RAISE;
         END IF;
END;
/



















        
