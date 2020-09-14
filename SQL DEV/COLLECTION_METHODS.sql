--COLLECTIONS METHODS
--1. COUNT
SET SERVEROUTPUT ON;
DECLARE
    TYPE my_nt_tbl IS TABLE OF NUMBER;
    var_nt my_nt_tbl := my_nt_tbl(1,2,3,4,5,6,7,8,9,10,20,3,58,5,52,69,48,23,74,69,2,15,286,59);
BEGIN
--    DBMS_OUTPUT.PUT_LINE('TOTAL NUMBERS OF ELEMENT IN COLLECTION IS '||var_nt.COUNT());
    FOR indx IN 1..var_nt.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('VALUE AT INDEX'||indx||' IS '||var_nt(indx));
    END LOOP;
END;
/

-- 2 EXITS
DECLARE 
    TYPE my_nt_tbl IS TABLE OF VARCHAR2(20);
    col_var_sup my_nt_tbl := my_nt_tbl('Superhero','Spiderman','Batman');
BEGIN
    IF col_var_sup.EXISTS (4) THEN
        DBMS_OUTPUT.PUT_LINE('VALUES IS PRESENT AT INDEX 4');
    ELSE
        DBMS_OUTPUT.PUT_LINE('VALUE IS NOT PRESENT AT INDEX 4. INSERTING NEW VALUE');
        col_var_sup.EXTEND;
        col_var_sup(4) := 'Avengers';
    END IF;

    DBMS_OUTPUT.PUT_LINE('VALUE INSERTED `'||col_var_sup(4)||'`');
END;
/
DECLARE
    TYPE nt IS TABLE OF NUMBER;
    var_nt nt := nt(1,2,3);
BEGIN
    DBMS_OUTPUT.PUT_LINE(var_nt.EXISTS(3));
  /*  IF var_nt.EXISTS (4) THEN
        DBMS_OUTPUT.PUT_LINE('VALUE IS NOT PRESENT');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('VALUE IS NOT PRESENT');
    END IF; */
END;
/
        