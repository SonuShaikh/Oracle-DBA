-- SYNCRONIZED DATABASE BACKUP COPY
CREATE TABLE SUPERHEROS_BACKUP AS SELECT * FROM SUPERHEROS WHERE 1 = 2;

CREATE OR REPLACE TRIGGER superhero_bckup 
BEFORE INSERT OR DELETE OR UPDATE ON superheros
FOR EACH ROW
ENABLE
BEGIN
    IF INSERTING THEN
        INSERT INTO superheros_backup VALUES (:NEW.sp_name);
    ELSIF DELETING THEN
        DELETE FROM superheros_backup WHERE sp_name = :OLD.sp_name;
    ELSIF UPDATING THEN
        UPDATE superheros_backup SET sp_name = :NEW.sp_name WHERE sp_name = :OLD.sp_name;
    END IF;
END;
/

SELECT * FROM SUPERHEROS;
SELECT * FROM SUPERHEROS_BACKUP;
INSERT INTO SUPERHEROS VALUES ('Batman');
INSERT INTO superheros VALUES ('Ironman');
DELETE FROM superheros WHERE sp_name = 'Batman';
UPDATE superheros SET sp_name = 'Sonu' WHERE sp_name ='Ironman'; 
SELECT * FROM sp_audit;
CREATE TABLE sp_audit_backup AS SELECT * FROM sp_audit WHERE 1 = 2;
DESC sp_audit;




-- BACKUP COPY OF AUDIT TABLE
CREATE OR REPLACE TRIGGER sp_audit_bck 
BEFORE INSERT OR DELETE OR UPDATE ON sp_audit
FOR EACH ROW 
ENABLE
BEGIN
    IF INSERTING THEN
        INSERT INTO sp_audit_backup VALUES (:NEW.new_name,:NEW.old_name,:NEW.user_name,:NEW.opr_date,:NEW.operation);
    ELSIF DELETING THEN
        DELETE FROM sp_audit_backup WHERE new_name = :OLD.new_name OR old_name =:OLD.old_name OR user_name = :OLD.user_name 
                    OR opr_date = :OLD.opr_date OR operation = :OLD.operation;
    ELSIF UPDATING THEN
        UPDATE sp_audit_backup
            SET 
                new_name  = :NEW.new_name,
                old_name  = :NEW.old_name,
                user_name = :NEW.user_name,
                opr_date  = :NEW.opr_date,
                operation = :NEW.operation
            WHERE
                new_name  = :OLD.new_name AND
                old_name  = :OLD.old_name AND
                user_name = :OLD.user_name AND
                opr_date  = :OLD.opr_date AND
                operation = :OLD.operation;
    END IF;
END;
/

SELECT * FROM SP_AUDIT;
SELECT * FROM SP_AUDIT_BACKUP;
INSERT INTO SUPERHEROS VALUES ('HULK MAN');
DELETE FROM SUPERHEROS WHERE sp_name = 'HULK MAN';
UPDATE SUPERHEROS SET sp_name = 'BATMAN' WHERE sp_name ='HULK';
UPDATE sp_audit SET NEW_NAME = 'HULK' WHERE NEW_NAME = 'SONU';















