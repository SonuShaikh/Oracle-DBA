-- DATABASE TRIGGERS 
-- Necessary Tables
    CREATE TABLE AUDIT_TABLE
     ( TABLE_NAME VARCHAR2(100),
    USERID VARCHAR2(100),
    OPERATION_DATE DATE,
    OPERATION VARCHAR2(100)
     );
     
    CREATE TABLE AUDIT_LOG
     ( USERID VARCHAR2(100),
    OPERATION_DATE DATE,
    B_CUSTOMERID NUMBER,
    A_CUSTOMERID NUMBER,
    B_FIRSTNAME VARCHAR2(100),
    A_FIRSTNAME VARCHAR2(100)
     );

SET SERVEROUTPU ON;
-- Simple Trigger Example
CREATE OR REPLACE TRIGGER trbi_superheros 
BEFORE INSERT ON superheros
FOR EACH ROW
ENABLE
DECLARE
    v_user VARCHAR2(20);
BEGIN
    SELECT user INTO v_user FROM dual;
    DBMS_OUTPUT.PUT_LINE(v_user||' YOU HAVE INSERTED ROW IN TABLE');
END;
/

--Insert values in superhero table
INSERT INTO superheros VALUES ('Ironman','Tony Stark');
INSERT INTO superheros VALUES ('Spiderman','Peter Parker');
INSERT INTO superheros VALUES('CapAmerica','Steve Roger');
SELECT * FROM SUPERHEROS;

-- DLM Event Trigger
CREATE OR REPLACE TRIGGER trbfdml_superheros
BEFORE INSERT OR DELETE OR UPDATE ON superheros
FOR EACH ROW
ENABLE
DECLARE
    v_user VARCHAR2(20);
BEGIN
    SELECT user INTO v_user FROM dual;
    
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('ONE ROW INSERTED BY'||v_user);
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('ONE ROW DELETED BY'||v_user);
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('ONE ROW UPDATED BY'||v_user);
    END IF;
END;
/

INSERT INTO superheros VALUES ('ShaktiMan','Gangadhar');
UPDATE superheros SET f_name = 'Shahabaj' WHERE f_name = 'sonu';
DELETE FROM superheros WHERE f_name = 'ShaktiMan';

--DML AUDIT TRIGER
--TABLE
CREATE TABLE sh_audit(
    fname_new VARCHAR2(30),
    fname_old VARCHAR2(30),
    lname_new VARCHAR2(30),
    lname_old VARCHAR2(30),
    UserName VARCHAR2(40),
    dateOfOp DATE,
    Operation VARCHAR2(30)
);
ALTER TABLE sh_audit MODIFY dateOfop VARCHAR2(40);

-- TRIGGER
CREATE OR REPLACE TRIGGER tr_superhero_audit
BEFORE INSERT OR DELETE OR UPDATE ON superheros
FOR EACH ROW
ENABLE
DECLARE
    v_user VARCHAR2(30);
    v_date VARCHAR2(40);
BEGIN
    SELECT user, TO_CHAR(sysdate, 'DD/MON/YY HH24:MI:SS')  INTO v_user, v_date FROM dual;
    
    IF INSERTING THEN
        INSERT INTO sh_audit
        VALUES( :NEW.f_name, NULL , :NEW.l_name, NULL, v_user, v_date,'Insert');
    ELSIF DELETING THEN
        INSERT INTO sh_audit
        VALUES( NULL, :OLD.f_name, NULL, :OLD.l_name, v_user, v_date,'Delete');
    ELSIF UPDATING THEN
        INSERT INTO sh_audit
        VALUES( :NEW.f_name, :OLD.f_name, :NEW.l_name, :OLD.l_name, v_user, v_date,'Update');
        END IF;
END;
/

INSERT INTO superheros VALUES ('ShaktiMan','Gangadhar');
UPDATE superheros SET f_name = 'Sonu' WHERE f_name = 'Shahabaj';
DELETE FROM superheros WHERE f_name = 'ShaktiMan';

SELECT * FROM sh_audit;

-- Synchronised Backup Copy
CREATE TABLE emp AS SELECT first_name,last_name,employee_id, salary FROM HR.employees where employee_Id = 1;
CREATE TABLE emp_backup AS SELECT * FROM emp;
SELECT * FROM emp_backup;

--Trigger (work with single column only)
CREATE OR REPLACE TRIGGER tr_syncbackup_emp
BEFORE INSERT ON emp
FOR EACH ROW
ENABLE
DECLARE
BEGIN
        IF inserting THEN
            INSERT INTO emp_backup VALUES ( :NEW.first_name, :NEW.last_name, :NEW.employee_Id, :NEW.salary);
        ELSIF deleting THEN
            DELETE FROM emp_backup WHERE employee_Id = :OLD.employee_id;
        ELSIF updating THEN
            UPDATE emp_backup SET first_name = :NEW.first_name, last_name = :NEW.last_name  WHERE employee_id = :OLD.employee_id;
        END IF;
END;
/

INSERT INTO emp SELECT first_name,last_name,employee_id,salary FROM HR.employees;
DELETE FROM emp WHERE first_name = 'David';
DELETE FROM emp WHERE employee_id = 101;

UPDATE emp SET first_name = 'Patty' WHERE employee_id = 202;

-- Disable trigger
ALTER TRIGGER trbi_superheros DISABLE;

-- DDL TRIGGER
-- CREATE DDL TRIGGER TO STORED CHANGES MADE TO SCHEMA
CREATE TABLE schema_audit(
    obj_date VARCHAR2(50),
    obj_user VARCHAR2(40),
    obj_name VARCHAR2(50),
    obj_type VARCHAR2(50),
    obj_operation VARCHAR2(50)
);
-- trigger
CREATE OR REPLACE TRIGGER tr_schema_audit
AFTER DDL ON SCHEMA
DECLARE
    v_date VARCHAR2(40);
    v_user VARCHAR2(30);
BEGIN
    
    SELECT user, TO_CHAR(sysdate,'DD-MON-YY HH24:MI:SS') INTO v_user, v_date FROM DUAL;
    
    INSERT INTO schema_audit VALUES(
    
       -- to_char(sysdate, 'DD-MON-YY 24HH:MI:SS'),
       v_date,
        --sys_context('USEREVN','CURRENT_USER'),
        v_user,
        ora_dict_obj_name,
        ora_dict_obj_type,
        ora_sysevent
    );

END;
/

SELECT * FROM schema_audit;
CREATE TABLE emp_backup1 AS SELECT first_name, last_name FROM HR.employees;
create table demo1 (name varchar2(30));
TRUNCATE TABLE emp_backup1;
DROP TABLE demo1;
DROP TABLE emp_backup;

-- DML TIRGGER ON DATABASE
CREATE TABLE database_audit(
    obj_date DATE,
    obj_user VARCHAR2(30),
    obj_name VARCHAR2(30),
    obJ_type VARCHAR2(30),
    obj_operation VARCHAR2(30)
) TABLESPACE USERS;

-- trigger on database
CREATE OR REPLACE TRIGGER tr_database_audit 
AFTER DDL ON DATABASE
DECLARE
    v_user VARCHAR2(30);
BEGIN
    SELECT user INTO v_user FROM dual;
    INSERT INTO database_audit VALUES(
        sysdate,
        v_user,
        ORA_DICT_OBJ_NAME,
        ORA_DICT_OBJ_TYPE,
        ORA_SYSEVENT
    );
END;
/
SELECT * FROM schema_audit;
SELECT * FROM database_audit;
create table demo (name varchar2(30));

-- DATABASE LOGON LOGOFF TRIGGER

CREATE TABLE schema_logon_audit(
    event_type VARCHAR2(30),
    logon_date DATE,
    logon_time VARCHAR2(30),
    logoff_date DATE,
    logoff_time VARCHAR2(30)
);

ALTER TABLE schema_logon_audit RENAME TO schema_event_audit;

-- LogonTrigger
CREATE OR REPLACE TRIGGER tr_syslogon_audit 
AFTER LOGON ON SCHEMA

BEGIN
    INSERT INTO  schema_event_audit VALUES(
        ora_sysevent,
        sysdate,
        TO_CHAR(sysdate,'hh24:mi:ss'),
        NULL,
        NULL
    );
END;
/
-- testing trigger     
disc
conn system/shaikh

SELECT * FROM schema_event_audit;

-- Logoff Trigger
CREATE OR REPLACE TRIGGER tr_syslogoff_audit
BEFORE LOGOFF ON SCHEMA
BEGIN
    INSERT INTO schema_event_audit VALUES(
        ora_sysevent,
        NULL,
        NULL,
        sysdate,
        TO_CHAR(sysdate,'hh24:mi:ss')
    );
END;
/

-- ** INSTED OF TRIGGER **

CREATE TABLE student (name VARCHAR2(30));
ALTER TABLE student RENAME COLUMN name TO stud_name;
CREATE TABLE subject (name VARCHAR2(30));
ALTER TABLE subject RENAME COLUMN name TO sub_name;

INSERT INTO student VALUES ('sonu');
INSERT INTO subject VALUES ('datascience');

--Show values     
SELECT * FROM student;
SELECT * FROM subject;
--Create view
CREATE OR REPLACE VIEW vw_demo AS SELECT stud_name,sub_name FROM student,subject;
--Shwo values
SELECT * FROM vw_demo;

-- INSTED OF insert trigger
CREATE OR REPLACE TRIGGER tr_instedof_vw_demo
INSTEAD OF INSERT ON vw_demo
FOR EACH ROW
BEGIN
    INSERT INTO student(stud_name) VALUES(:NEW.stud_name);
    INSERT INTO subject(sub_name) VALUES(:NEW.sub_name);
END;
/
     
INSERT INTO vw_demo VALUES ('Anita','Oracle');

-- INSTEAD OF UPDATE TRIGGER
CREATE OR REPLACE TRIGGER tr_tr_instedofup_vw_demo
INSTEAD OF UPDATE ON vw_demo
FOR EACH ROW
BEGIN   
        UPDATE student SET stud_name = :NEW.stud_name WHERE stud_name = :OLD.stud_name;
        UPDATE subject SET sub_name = :NEW.sub_name WHERE sub_name = :OLD.sub_name;
END;
/

UPDATE vw_demo SET stud_name = 'Shahabaj' WHERE stud_name = 'sonu';
     