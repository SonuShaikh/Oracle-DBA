-- DYNAMIC SQL
SET SERVEROUTPU ON;
DECLARE 
    v_sqlQuery VARCHAR2(150);
    v_totalemp NUMBER;

BEGIN
        v_sqlQuery := 'SELECT COUNT(*) FROM HR.EMPLOYEES';
        EXECUTE IMMEDIATE v_sqlQuery INTO v_totalemp;
        
        DBMS_OUTPUT.PUT_LINE('Total number of employees'|| v_totalemp);
END;
/

--DDL STATEMENT
DECLARE
    ddl_qry VARCHAR2(150);
BEGIN
    ddl_qry := ' CREATE TABLE demo2( user_name VARCHAR2(20),    user_id NUMBER )';
    EXECUTE IMMEDIATE ddl_qry;
END;
/

--Exmple 2
DECLARE
    ddl_qry  VARCHAR2(300);
BEGIN
    ddl_qry := 'CREATE TABLE demo3 ('||
    'stud_id NUMBER CONSTRAINT const_pk_studid PRIMARY KEY,'||
   ' name VARCHAR2(30))';
    EXECUTE IMMEDIATE ddl_qry;   
END;
/

-- Example 3
DECLARE
    ddl_qry VARCHAR2(150);
BEGIN
        ddl_qry := 'ALTER TABLE demo3 ADD location VARCHAR2(30)';
        EXECUTE IMMEDIATE ddl_qry;
END;
/

DESC demo3;

-- BIND VARAIBLE WITH EXECUTE IMMEDIATE (USING CLAUSE);
-- Sequery again SQL ingections 
-- 
DECLARE
    sql_stmt VARCHAR2(150);
BEGIN
        sql_stmt := 'INSERT INTO demo3(stud_id) values (:var_studid)';
        EXECUTE IMMEDIATE sql_stmt USING 5;
        sql_stmt := 'INSERT INTO demo3(stud_id, name) values (:var_studid, :var_name)';
        EXECUtE IMMEDIATE sql_stmt USING 3,'sonu';
END;
/

SELECT * FROM demo3;

-- BULK COLLECT CLAUSE

DECLARE
    sql_stmt VARCHAR2(150);
    TYPE mynt IS TABLE OF VARCHAR2(30);
    var_name mynt;
BEGIN
     sql_stmt := 'SELECT first_name FROM HR.employees';
     EXECUTE IMMEDIATE sql_stmt BULK COLLECT INTO var_name;
    
    FOR indx IN 1.. var_name.COUNT 
    LOOP
        DBMS_OUTPUT.PUT_LINE(var_name(indx));
    END LOOP;   
END;
/

-- EXECUTING PL/SQL BLOCK WITH execute IMMEDITE BLOCK
DECLARE
    plsql_block VARCHAR2(300);
BEGIN
    plsql_block := '
        DECLARE
            v_user VARCHAR2(30);
        BEGIN 
            select user INTO v_user from dual;
            DBMS_OUTPUT.PUT_LINE(''Current Logon User ''||v_user);
        END;';
        
        EXECUTE IMMEDIATE plsql_block;
END;
/
        

























