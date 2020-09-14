--INSTED ON TRIGGER
CREATE TABLE trainer   ( full_name VARCHAR2(30));
CREATE TABLE subject (sub_name VARCHAR2(30));

INSERT INTO trainer VALUES ('manish');
INSERT INTO subject VALUES('python');

CREATE VIEW vw_rebellion AS SELECT full_name,sub_name FROM trainer, subject;
INSERT INTO vw_rebellion VALUES('sonu','shaikh');
update vw_rebellion set full_name = 'Shahabaj' where full_name = 'sonu';
DELETE FROM vw_rebellion WHERE full_name = 'sonu';
SELECT * FROM vw_rebellion;

-- INSTED OF INSERT TRIGER
CREATE OR REPLACE TRIGGER tr_instedof_vw_rebellion
INSTEAD OF INSERT ON vw_rebellion
FOR EACH ROW
BEGIN
    INSERT INTO trainer VALUES (:NEW.full_name);
    INSERT INTO subject VALUES (:NEW.sub_name);
END;
/

-- INSTEAD OF UPDATE TRIGGER
CREATE OR REPLACE TRIGGER tr_instof_upd_vw_rebellion
INSTEAD OF UPDATE ON vw_rebellion
FOR EACH ROW
BEGIN
    UPDATE trainer SET full_name = :NEW.full_name WHERE full_name = :OLD.full_name;
    UPDATE subject SET sub_name = :NEW.sub_name WHERE sub_name = :OLD.sub_name;
END;
/
SELECT LENGTH('tr_instof_upd_vw_rebellion') FROM DUAL;

-- INSETED OF DELETE TRIGGER
CREATE OR REPLACE TRIGGER tr_instof_dlt_vw_rebellion
INSTEAD OF DELETE ON vw_rebellion
FOR EACH ROW
BEGIN
    DELETE FROM trainer WHERE full_name = :OLD.full_name;
    DELETE FROM subject WHERE sub_name = :NEW.sub_name;
END;
/

DELETE FROM vw_rebellion WHERE full_name = 'SONU SHAIKH';
select * from vw_rebellion;

SELECT * FROM subject;
SELECT * FROM trainer;

COMMIT;