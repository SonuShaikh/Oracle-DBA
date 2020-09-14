CREATE TABLE superheroes (sh_name VARCHAR2(30));

CREATE OR REPLACE TRIGGER bi_superheroes 
BEFORE INSERT ON superheroes
FOR EACH ROW
ENABLE
DECLARE
    v_user VARCHAR(30);
BEGIN
    SELECT user INTO v_user FROM dual;
    INSERT INTO DDLAUDITTABLE VALUES (v_user,'INSERTING');
END;
/
SET SERVEROUTPUT ON;
INSERT INTO superheroes values('sonu');
DELETE FROM superheroes;

CREATE TABLE ddlaudittable (username varchar2(30),operation_name VARCHAR2(30));
SELECT * FROM ddlaudittable;

-- deleting
CREATE OR REPLACE TRIGGER bd_superheroes
BEFORE DELETE ON superheroes
FOR EACH ROW
ENABLE
DECLARE
    v_user VARCHAR2(30);
BEGIN
    SELECT user INTO v_user FROM dual;
    INSERT INTO ddlaudittable VALUES(v_user,'DELETING');
END;
/

DELETE FROM DDLAUDITTABLE;

-- TRIGGER ALL IN ONE   
CREATE OR REPLACE TIRGGER tr_superheroes
BEFORE DELETE OR INSERT OR DELETE ON superheroes
FOR EACH ROW
ENABLE
DECLARE
    v_user VARCHAR2(30);
BEGIN
    SELECT user INTO v_user FROM dual;
    IF INSERTING THEN
        INSERT INTO ddlaudittable VALUES (v_user,'INSERTING');
    ELSIF DELETING THEN
        INSERT INTO ddlaudittable VALUES (v_user,'DELETING');
    ELSIF UPDATEING THEN
        INSERT INTO ddlaudittable VALUES (v_user,'DELETING');
    END;
END;
/
        























