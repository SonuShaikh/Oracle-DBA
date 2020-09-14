--EXECUTE IMMEDIATE
SET SERVEROUTPUT ON;
DECLARE
    sql_query VARCHAR2(150);
    qr_rslt NUMBER(3);
BEGIN
    sql_query := 'SELECT count(*) FROM employees';
    EXECUTE IMMEDIATE sql_query INTO qr_rslt;
    DBMS_OUTPUT.PUT_LINE('Total Number Of employees '||qr_rslt);
END;
/

-- EXECUTING DDL STATMENT USING 
DECLARE
    ddl_qury VARCHAR2(150);
BEGIN
    ddl_qury := 'CREATE TABLE tut10( t_name VARCHAR2(30),t_num NUMBER)';
    EXECUTE IMMEDIATE ddl_qury;
END;
/
-- ALTER DDL
DECLARE
    ddl_qry VARCHAR2(150);
BEGIN
    ddl_qry := 'ALTER TABLE tut10 ADD tut_date DATE';
    EXECUTE IMMEDIATE ddl_qry;
END;
/
DESC tut10;
-- DROP TABLE
DECLARE
    ddl_qry VARCHAR2(150);
BEGIN
    ddl_qry := 'DROP TABLE tut10';
    EXECUTE IMMEDIATE ddl_qry;
END;
/
--
    CREATE TABLE stud_info ( stud_name VARCHAR2(30));
--
/
-- BIND VARIABLE : EXECUTE IMMEDIAT .. USING CLAUSE
DECLARE
    sql_query VARCHAR2(150);
BEGIN
    sql_query :='INSERT INTO stud_info(stud_name) VALUES (:student_name)';
    EXECUTE IMMEDIATE sql_query USING 'Sonu';
END;
/
SELECT * FROM STUD_INFO;
-- MULTIPLE BIND VARIABLE 
DECLARE
    sql_stmn VARCHAR2(150);
BEGIN
    sql_stmn := 'UPDATE stud_info SET stud_name = :new_name WHERE stud_name = :old_name';
    EXECUTE IMMEDIATE sql_stmn USING 'Strange','ANITA';
END;
/
SELECT STUD_NAME FROM STUD_INFO;
-- EXECUTE IMMEDIATE WITH BULK COLLECT CLAUSE
DECLARE 
    TYPE nt_fname IS TABLE OF VARCHAR2(60);
    fname nt_fname;
    sql_query VARCHAR2(150);
BEGIN
    sql_query := 'SELECT FIRST_NAME FROM EMPLOYEES';
    EXECUTE IMMEDIATE sql_query BULK COLLECT INTO fname;
    
    FOR indx IN 1..fname.COUNT 
    LOOP    
        DBMS_OUTPUT.PUT_LINE(indx||' '||fname(indx));
    END LOOP;
END;
/



















