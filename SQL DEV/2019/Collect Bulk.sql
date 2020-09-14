SET SERVEROUTPUT ON;
DECLARE
    TYPE nt_fName IS TABLE OF VARCHAR2(30);
    fname nt_fName;
BEGIN
    SELECT first_name BULK COLLECT INTO fname
    FROM EMPLOYEES;
    
    FOR indx IN 1..fname.COUNT 
    LOOP
        DBMS_OUTPUT.PUT_LINE(indx||' '||fname(indx));
    END LOOP;
    
END;
/
-- BULK COLLECT CLAUS WITH FETCH INTO STATEMENT OF AN EXPLICITE CURSOR
DECLARE
    CURSOR exp_cur IS
        SELECT FIRST_NAME FROM EMPLOYEES;
        
    TYPE nt_tbl IS TABLE OF VARCHAR2(20);
    fname nt_tbl;
    
BEGIN
    OPEN exp_cur;
    LOOP
        FETCH exp_cur BULK COLLECT INTO fname;
        EXIT WHEN fname.COUNT = 0;
        
         FOR indx IN 1..fname.COUNT
            LOOP
                DBMS_OUTPUT.PUT_LINE(indx||' '||fname(indx));
         END LOOP;
    END LOOP;    
    CLOSE exp_cur;
END;
/
-- BULK COLLECT WITH LIMIT CLAUSE
DECLARE
    CURSOR exp_cur IS 
        SELECT FIRST_NAME FROM EMPLOYEES;
    TYPE nt_tbl IS TABLE OF VARCHAR2(30);
    var_1 nt_tbl;
    indx NUMBER;
BEGIN
    OPEN exp_cur;
    FETCH exp_cur BULK COLLECT INTO var_1 LIMIT 10;
        FOR indx IN 1..var_1.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE(indx||' '||var_1(indx));
        END LOOP;
    CLOSE exp_cur;
END;
/




















