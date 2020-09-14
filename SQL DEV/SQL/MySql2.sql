desc student;
select * from student;
/

SET SERVEROUTPUT ON;
DECLARE 
v_name STUDENT.NAME%TYPE;
v_rollno STUDENT.ROLLNO %TYPE;
BEGIN
SELECT name,rollno INTO v_name,v_rollno from student 
where rollno = 1;
DBMS_OUTPUT.PUT_LINE(v_name ||' Has Rollnumber ' || v_rollno);
END;



/



SET SERVEROUTPUT ON;
DECLARE
 v_rollno STUD.rollno % type;
 v_name STUD.name  % type;
 BEGIN
 SELECT ROLLNO,NAME INTO v_rollno,v_name from STUD where name = 'ANita';
 DBMS_OUTPUT.PUT_LINE(v_rollno || ' Roll no is of '|| v_name);
 END;
 
 /
 -- DECLAREING A CONSTANT
 SET SERVEROUTPUT ON;
 DECLARE
 v_pi CONSTANT NUMBER (7,6) := 3.141592;
 BEGIN
 DBMS_OUTPUT.PUT_LINE('VALUE OF THE PI ' || v_pi);
 END;
/
-- DEFOULT KEYWORD AND NOT NULL KEYWORD
SET SERVEROUTPUT ON;
DECLARE 
v_pi CONSTANT NUMBER(7,6) NOT NULL DEFAULT 3.141592;
BEGIN 
DBMS_OUTPUT.PUT_LINE('pi HAS VALUE ' || v_pi);
END;
/

-- BIND VARIALBLE
VARIABLE v_bind1 VARCHAR2(20);
EXECUTE v_bind1 := 'SHAIKH SHAHABAJ';
SET SERVEROUTPUT ON;
BEGIN
 :v_bind1 := 'SONU MONU';
DBMS_OUTPUT.PUT_LINE(:V_bind1);
END;
























