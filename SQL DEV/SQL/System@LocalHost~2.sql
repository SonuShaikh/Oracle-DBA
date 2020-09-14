SET SERVEROUPUT ON;
 CREATE OR REPLACE TRIGGER superheros_Audit
 BEFORE INSERT OR DELETE OR UPDATE ON superheros
 FOR EACH ROW
 ENABLE
 DECLARE
 v_user VARCHAR2(30);
 v_date VARCHAR2(30);
 BEGIN
 SELECT USER, TO_CHAR(SYSDATE,'DD/FRI/YYYY HH24:MI:SS' ) INTO v_user, v_date from DUAL;
 IF INSERTING THEN
       INSERT INTO sh_audit(new_name,old_name,user_name,entry_date,operation)
       VALUES(:NEW.sh_name, NULL,v_user,v_date,'Inserting');
 ELSIF DELETING THEN
      INSERT INTO sh_audit(new_name, old_name,user_name,entry_date,operation)
      VALUES (NULL, :OLD.sh_name,v_user,v_date,'Deleting');
 ELSIF UPDATING THEN
      INSERT INTO sh_audit(new_name,old_name,user_name,entry_date,operation)
      VALUES(:NEW.sh_name,:OLD.sh_name,v_user,v_date,'UPDATING');
  END IF;
  END;
  /
  
  
  INSERT INTO SUPERHEROS VALUES( 'SONY SHAIKH');