--PACKAGE IN PL-SQL 
--PACKAGE HEADER
CREATE OR REPLACE PACKAGE pkg_RebellionRider IS
    FUNCTION prnt_strn RETURN VARCHAR2;
    PROCEDURE proc_superheros(fname VARCHAR2,lname VARCHAR2);
END;
/


--PACKAGE BODY
CREATE OR REPLACE PACKAGE BODY pkg_RebellionRider IS
 
 --** FUNCTION IMPLEMENTATION
 FUNCTION prnt_strn RETURN VARCHAR2 IS
    BEGIN
        RETURN 'PROGRAMMER NEVER DIE';
    END prnt_strn;
    
 --** PROCEDURE IMPLEMENTATIONS
 PROCEDURE proc_superheros(fname VARCHAR2,lname VARCHAR2) IS
    BEGIN
        INSERT INTO new_superheros VALUES(fname,lname);
    END proc_superheros;
    
END pkg_RebellionRider;
/

--** CALLING PACKAGE FUNCTION ELEMENT 
BEGIN
 DBMS_OUTPUT.PUT_LINE(pkg_RebellionRider.prnt_strn());
END;
/

--** CALLING PACKAGE PROCEDURE ELEMENT
EXECUTE pkg_RebellionRider.proc_superheros('Sonu','Shaikh');

SELECT * FROM new_superheros;

--PACKAGE FOR MATHEMATICS
--HEADER
CREATE OR REPLACE PACKAGE pkg_Mathematics IS
    FUNCTION  func_sqrt(Num NUMBER) RETURN NUMBER;
    PROCEDURE proc_add(Num1 NUMBER, Num2 NUMBER);
END;
/
-- BODY
CREATE OR REPLACE PACKAGE BODY pkg_Mathematics IS
BEGIN
    --IMPLEMENTATION OF FUCTION
    FUNCTION func_sqrt(Num NUMBER) RETURN NUMBER IS
        BEGIN    
            RETURN (Num * Num);
        END func_sqrt;    
    --IMPLEMENTAION OF PROCEDURE
    
    PROCEDURE proc_add(Num1 NUMBER,Num2 NUMBER) IS
        var_result NUMBER;
        BEGIN
            var_result := Num1 + Num2;
            DBMS_OUTPUT.PUT_LINE('ADDITION OF '||Num1||' AND '||Num2||' Is = '||var_result);
        END proc_add;
END pkg_mathematics;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE(PKG_MATHEMATICS.FUNC_SQRT(5));
END;
/

















