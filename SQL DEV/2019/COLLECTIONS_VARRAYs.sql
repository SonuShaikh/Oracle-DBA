--VARRAY IN ORACLE
/* 
    **SYNTAX**
    CREATE OR REPLACE vary_array IS [VARRAY | VARIABLE ARRAY] (SIZE_OF_ARRAY) OF ELEMENT_DATA_TYPE;
    EXTEND -- USER FOR PASSING VALUES IN BEGIN SECTION OF PLSQL BLOCK.
*/
SET SERVEROUTPUT ON;
DECLARE
    TYPE inBlock_vry IS VARRAY (5)OF NUMBER;
    vry_obj inBlock_vry := inBlock_vry();
BEGIN
    vry_obj.EXTEND(5);
    FOR indx IN 1..vry_obj.LIMIT 
    LOOP
        vry_obj(indx) := 10 * indx;
        DBMS_OUTPUT.PUT_LINE(vry_obj(indx));
    END LOOP;
END;
/
-- WITHOUT EXTEND
DECLARE
    TYPE inBlock_vry IS VARRAY (5) OF NUMBER;
    vry_obj inBlock_vry := inBlock_vry(9,8,7,6,5);
BEGIN
    FOR indx IN 1..vry_obj.LIMIT
    LOOP
        DBMS_OUTPUT.PUT_LINE('Value at index '||indx||' is : '||vry_obj(indx));
    END LOOP;
END;
/

-- EXTEND IN LOOP
DECLARE
    TYPE inBlock_vry IS VARRAY (5) OF NUMBER;
    vry_obj inBlock_vry := inBlock_vry();
BEGIN
    FOR indx IN 1..vry_obj.LIMIT
    LOOP
        vry_obj.EXTEND;
        vry_obj(indx) := (indx * 20) - 10;
        DBMS_OUTPUT.PUT_LINE('Value at index '||indx||' is : '||vry_obj(indx));
    END LOOP;
END;
/
    
-- VARRY AS DATABASE OBJECT
CREATE OR REPLACE TYPE dbObj_vry IS VARRAY (5) OF NUMBER;
/
CREATE TABLE Calender
(
    day_name VARCHAR2(30),
    day_date dbObj_vry
);
SELECT * FROM Calender;
INSERT INTO Calender VALUES('Sunday',dbObj_vry(7,14,21,28));
INSERT INTO CAlender VALUES('Monday',dbObj_vry(8,15,22,29));
DELETE FROM Calender WHERE day_name = 'Monday';
/
SELECT 
    Cal.day_name,
    vry.COLUMN_VALUE
    FROM Calender Cal, TABLE(Cal.day_date) vry;















    
    
    