-- VARIABLE
SET SERVEROUTPUT ON;
DECLARE
    v_name VARCHAR2(30) := 'Sonu SHaikh';
    v_age Number;
    v_constant1 VARCHAR2(20) NOT NULL := 'HELLO WORLD1';
    v_constant2 VARCHAR2(20) NOT NULL DEFAULT 'HELLO WORLD2';
BEGIN
    v_age := 20;
    DBMS_OUTPUT.PUT_LINE(v_name||' reached at '||v_age);
    DBMS_OUTPUT.PUT_LINE(v_constant1||' '||v_constant2);
END;
/

-- BIND VARIABLE
VARIABLE bind1 VARCHAR2(30);
EXECUTE :bind1 := 'Bind variable'; 
SET AUTOPRINT ON;
PRINT bind1;


-- ANCHORE DATA TYPE
CREATE TABLE DEMO1 ( name VARCHAR2(30), roll_no NUMBER);
INSERT INTO DEMO1 VALUES('Sonu',12);

DECLARE
   v_name HR.DEMO1.name%TYPE;
   v_roll_no HR.DEMO1.roll_no%TYPE;
BEGIN
    SELECT name,roll_no INTO v_name, v_roll_no FROM DEMO1 WHERE roll_no = 12;
    DBMS_OUTPUT.PUT_LINE(v_name||' '||v_roll_no);
END;
/

-- SIMPLE LOOP STATEMENTS
DECLARE
   v_counter NUMBER := 0;
BEGIN
   LOOP
    v_counter := v_counter + 1;
    DBMS_OUTPUT.PUT_LINE(v_counter);
    EXIT WHEN v_counter = 10;
  END LOOP;
END;
/

-- WHILE LOOP STATEMENT
 DECLARE
   v_count NUMBER :=1;
   v_result NUMBER;
BEGIN
   WHILE v_count <= 10 LOOP
     v_result := v_count * 20;
     DBMS_OUTPUT.PUT_LINE(v_result);
     v_count := v_count + 1;
   END LOOP;
END;
/

-- FOR LOOP
-- NUMERIC FOR LOOP
DECLARE
    v_cont NUMBER :=1;
BEGIN
   FOR v_count IN 1 .. 10 LOOP
       DBMS_OUTPUT.PUT_LINE(v_count);
   END LOOP;
END;
/
-- FOR REVERS LOOP
BEGIN
   FOR v_counter IN REVERSE  1 .. 20 LOOP
     DBMS_OUTPUT.PUT_LINE(v_counter);
   END LOOP;
END;
/

CREATE TABLE Audit_Ex ( name VARCHAR2(30));
CREATE TABLE Auditing_data
(
   New_name VARCHAR2(30),
   Old_name VARCHAR2(30),
   User_name VARCHAR2(30),
   entry_date VARCHAR2(30),
   operation_name VARCHAR2(30)
   );
--TABLE AUDITING
CREATE OR REPLACE TRIGGER tr_a
AFTER INSERT OR DELETE OR UPDATE ON Audit_Ex
FOR EACH ROW
DISABLE
DECLARE
   v_user VARCHAR2(30);
   v_date VARCHAR2(30);
BEGIN
    SELECT USER,TO_CHAR(SYSDATE,'DD/MON/YYYY HH24:MI:SS') INTO v_user,v_date FROM DUAL;
    IF INSERTING THEN
       INSERT INTO Auditing_data(New_name,Old_name,User_name,Entry_date,Operation_name)
         VALUES(:NEW.name,NULL,v_user,v_date,'INSERT');
    ELSIF DELETING THEN
       INSERT INTO Auditing_data(New_name,Old_name,User_name,Entry_date,Operation_name)
         VALUES(NULL,:OLD.name,v_user,v_date,'DELETE');
    ELSIF UPDATING THEN
      INSERT INTO Auditing_data(New_name,Old_name,User_name,Entry_date,Operation_name)
         VALUES(:NEW.name,:OLD.name,v_user,v_date,'UPDATE');
    END IF;
END;
/
       


INSERT INTO AUDIT_EX VALUES('SONU');
SELECT * FROM AUDITING_DATA ;

SELECT * FROM SCHEMA_AUDIT;

-- DDL TRIGGER
CREATE OR REPLACE TRIGGER tr_ddlschema_audit
AFTER DDL ON SCHEMA

BEGIN 
    --SELECT TO_CHAR(SYSDATE,'DD/MON/YYYY HH24:MI:SS') INTO v_date FROM dual;
    INSERT INTO schema_audit VALUES(
      SYSDATE,
      user,
      ora_dict_obj_type,
      ora_dict_obj_name,
      ora_sysevent
     );
END;
/
SELECT * FROM SCHEMA_AUDIT;


CREATE TABLE sonumonu3(name varchar2(30));







