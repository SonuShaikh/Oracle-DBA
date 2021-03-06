CREATE TABLE SUPERHERO ( sp_name VARCHAR2(30));

-- INTRODUCTION TO TRIGGER
SET SERVEROUTPUT ON;
CREATE OR REPLACE  TRIGGER bi_superhero
BEFORE INSERT ON SUPERHERO
FOR EACH ROW
ENABLE
DECLARE 
v_user VARCHAR2(30);
BEGIN
SELECT user INTO v_user from DUAL;
DBMS_OUTPUT.PUT_LINE('ONE ROW INSERTED BY USER ' || v_user);
END ;
/
show user;
