--COLLECTIONS IN ORACLE DATABASE
/*
THERE ARE 3 TYPE OF COLLECTIONS IN ORACLE DATABASE. 
    1. PERSISTANCE
        A. NESTED TABLE 
        B. VARRRAY(VARIABLE ARRAY)
    2.IN PERSISTANCE
        A. ACCOCIATE COLLECTION
*/

-- NESTED TABLE
-- SYNTAX
-- DECLARE TYPE nested_table_name IS TABLE OF element_type;
SET SERVEROUTPUT ON;
DECLARE
    TYPE my_nested_table IS TABLE OF NUMBER;
    v_nt my_nested_table := my_nested_table(1,2,3,4,5,6,6,7,8,9,38,86,78,65,34,34,67,89,00,100);
BEGIN
    DBMS_OUTPUT.PUT_LINE('VALUE AT INDEX `1` IS `'||v_nt(1)||'`');
    DBMS_OUTPUT.PUT_LINE('USING FOR LOOP');
    
    FOR inxd IN 1..v_nt.COUNT 
    LOOP
    DBMS_OUTPUT.PUT_LINE('Value Stored at index '||inxd||'  is '||v_nt(inxd));
    END LOOP;
END;
/

--EXAMPLE 2
DECLARE
    TYPE my_nested_table_varchar IS TABLE OF VARCHAR2(10);
    v_nt my_nested_table_varchar := my_nested_table_varchar('SELECT','FIRST_NAME','FROM','EMPLOYEES');
BEGIN
    FOR indx IN 1..v_nt.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(v_nt(indx));
    END LOOP;
END;
/

-- CREATE NESTED TABLE AS DATABASE COLLECTION OBJECT
CREATE OR REPLACE TYPE my_nested_table IS TABLE OF VARCHAR2(30);
/
CREATE TABLE tbl_subject(
    sub_id NUMBER,
    sub_name VARCHAR2(30),
    sub_schedule_day my_nested_table
    )NESTED TABLE sub_schedule_day STORE AS sub_nested_tbl_space;
/

DESC tbl_subject;

INSERT INTO tbl_subject VALUES (100,'DBMS',my_nested_table('mon','tue','wen'));
SELECT * FROM tbl_subject;

-- EXAPLE 2
CREATE OR REPLACE TYPE teacher_nested_table IS TABLE OF VARCHAR2(30);
/

CREATE TABLE tbl_teacher
    (
        tech_id NUMBER,
        tech_name VARCHAR2(30),
        tech_sub teacher_nested_table
    )NESTED TABLE tech_sub STORE AS techer_nst_tbl_space;

INSERT INTO tbl_teacher VALUES(100,'SONU',teacher_nested_table('DBMS','JAVA','PYTHON'));
SELECT * FROM tbl_teacher;

-- NESTED TABLE USING USER DEFIND DATA TYPE
CREATE OR REPLACE TYPE  user_obj AS OBJECT(
    obj_id NUMBER,
    obj_name VARCHAR2(30));
/
--NESTED TABLE
CREATE OR REPLACE TYPE usr_my_nested_table AS TABLE OF user_obj;
/
CREATE TABLE tbl_usrdatatype 
(
    user_id NUMBER,
    job_details usr_my_nested_table
    )NESTED TABLE job_details STORE AS nt_tab1_store;

INSERT INTO tbl_usrdatatype VALUES (100,usr_my_nested_table(10,'SYSTEM ADMIN'));

















    