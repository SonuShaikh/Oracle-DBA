
SET SERVEROUTPUT ON;
DECLARE 
v_sonu VARCHAR2(20) := 'Shaikh Shahabaj';
BEGIN
DBMS_OUTPUT.PUT_LINE(v_sonu);
end;
/
SET SERVEROUTPUT ON;
DECLARE 
v_name varchar2(10) ;
BEGIN
v_name := 'sHAIKH';
DBMS_OUTPUT.PUT_LINE(v_name);
END;

/

DESCRIBE STUDENT;
SELECT * FROM STUDENT;

/

SET SERVEROUTPUT ON;
DECLARE V_NAME STUDENT.NAME %TYPE;
BEGIN 
SELECT NAME INTO V_NAME FROM STUDENT WHERE ROLLNO =1;
DBMS_OUTPUT.PUT_LINE(V_NAME);
END;
/

SET SERVEROUTPUT ON;
DECLARE 
V_ROLLNO STUDENT.ROLLNO % TYPE
BEGIN 
SELECT ROLLNO INTO V_ROLLNO FROM STUDENT WHERE NAME ='sony';

DBMD_OUTPUT.PUT_LINE(ROLLNO);

END;






















