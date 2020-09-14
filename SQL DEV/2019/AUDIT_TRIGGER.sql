-- AUDIT TRIGGER
CREATE TABLE SUPERHEROS (sp_name VARCHAR2(30));
CREATE TABLE sp_audit(
    new_name    VARCHAR2(30),
    old_name    VARCHAR2(30),
    user_name   VARCHAR2(30),
    opr_date    VARCHAR2(30),
    operation   VARCHAR2(30));
    

-- TRIGGER
CREATE OR REPLACE TRIGGER superheros_audit 
BEFORE INSERT OR DELETE OR UPDATE ON superheros
FOR EACH ROW
ENABLE
DECLARE
    v_user VARCHAR2(30);
    v_date VARCHAR2(30);
BEGIN
    SELECT user,TO_CHAR(SYSDATE,'DD/MM/YY HH24:MI:SS') INTO v_user,v_date FROM dual;
IF INSERTING THEN
    INSERT INTO sp_audit (new_name,old_name,user_name,opr_date,operation) 
    VALUES(:NEW.sp_name,NULL,v_user,v_date,'INSERTING');
ELSIF DELETING THEN
    INSERT INTO sp_audit (new_name,old_name,user_name,opr_date,operation) 
    VALUES(NULL,:OLD.sp_name, v_user,v_date,'DELETING');
ELSIF UPDATING THEN
    INSERT INTO sp_audit (new_name,old_name,user_name,opr_date,operation) 
    VALUES(:NEW.sp_name,:OLD.sp_name,v_user,v_date,'UPDATING');
END IF;
END;
/

SELECT * FROM superheros;
SELECT * FROM sp_audit;
INSERT INTO superheros VALUES('MONU');
UPDATE supeRheros SET sp_name = 'Ironman' WHERE sp_name = 'SONU';
DELETE FROM SUPERHEROS WHERE sp_name = 'Ironman';
DELETE FROM SUPERHEROS;





















