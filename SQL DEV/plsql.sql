-- INTORDUCTION TO PL-SQL BLOCKS
SET SERVEROUTPUT ON;
-- DECLARING AND INITIALIZATION OF VERIABLE
DECLARE
   v_name VARCHAR2(30) := 'HELLO SONU';
   v_age  NUMBER(2);
BEGIN
   v_age := 20;
   DBMS_OUTPUT.PUT_LINE(v_name||' You Are '||v_age||' Year Old.');
END;
/
-- SELECTING RECORD IN VERIABLE FROM TABLE
DECLARE
   v_first VARCHAR2(30);
   v_gf_name VARCHAR2(30);
BEGIN
    SELECT name, girlfriend_name INTO v_first, v_gf_name FROM buddy WHERE name =  'Anita';
    DBMS_OUTPUT.PUT_LINE(v_gf_name|| ' is '||v_first||'`s girlfriend. ');
END;
/

-- INTRODUCTION TO ANCHORE DATA TYPE
-- SYNTAX
-- Variable_Name Type_Attribute %Type
DECLARE
    v_babename HR.babes.name%TYPE;
    v_bf       HR.babes.bf_name%TYPE;
BEGIN
    SELECT name,bf_name INTO v_babename,v_bf FROM hr.babes WHERE name='Shital';
    DBMS_OUTPUT.PUT_LINE(v_babename|| ' Is In Relation With '||v_bf);
END;
/

-- INTRODUCTION TO CONSTANT
-- SYNTAX variable_name CONSTANT datatype(dw) := value
-- ** CONSTANT VARIABLE MUST BE DECLARE IN DECLARATION SESSION AND MUST BE INITIALISE AT THE TIME OF DECLARATION
DECLARE
   v_pi NUMBER(7,6) NOT NULL := 3.141592;
BEGIN
   DBMS_OUTPUT.PUT_LINE('The Value Of Pi Is '|| v_pi);
END;
/
-- CONSTANT USEING DEFAULT KEY WORD
DECLARE
   v_pi NUMBER(7,6) NOT NULL DEFAULT 3.141592;
BEGIN
   DBMS_OUTPUT.PUT_LINE('The Value Of Pi Is '|| v_pi);
END;
/
-- INTODUCTION TO BIND VARIABLE
VARIABLE v_bind1 VARCHAR2(30);
VARIABLE v_bind3 NUMBER;
EXECUTE :v_bind1 := 'Shaikh Shahabaj';
-- DISPLAY BIND VARIABLE METHODE 1
PRINT :v_bind1 ;
-- DISPLAY BIND VARIABLE METHODE 2
SET AUTOPRINT ON;
VARIABLE v_bind2 VARCHAR2(30);
EXECUTE :v_bind2 := 'Anita Dapke';
-- DISPLAY BIND VARIABLE METHODE 3
SET SERVEROUTPUT ON;
BEGIN
  :v_bind2 := 'Anita Dapke';
  DBMS_OUTPUT.PUT_LINE(:v_bind2);
END;
/


           -- CONTROL STATEMENTS
           -- TWO TYPES OF CONTROL STATEMENTS
           -- 1. IF STATEMENT
                -- a.IF THEN
                -- B.IF THEN ELSE
                -- C.IF THEN ELSIF
           -- 2. CASE STATEMENT 
                -- a. SIMPLE CASE
                -- b. SEARCH CASE
                
-- A. IF THEN CONDITION
--    SYNTAX
--   IF CONDITION THEN
--      STATMENTS..
--   END IF;

VARIABLE v_age NUMBER;
--EXECUTE 
SET AUTOPRINT OFF;

BEGIN
   :v_age := 14;
  IF :v_age < 20 THEN
     DBMS_OUTPUT.PUT_LINE('YOU ARE NOT OLD ENOUGH TO VISITE THIS SITE');
  END IF;
  DBMS_OUTPUT.PUT_LINE('THANK YOU....!');
END;
/

-- IF THEN ELSE STATEMENT
-- SYNTAX
-- IF CONDITION THEN
--    STATMENT
-- ELSE
--    STATMENT
-- END IF;
DECLARE
    v_num NUMBER := &INTEGER_NUMBER;
BEGIN
   IF MOD(v_num,2) = 0 THEN
      DBMS_OUTPUT.PUT_LINE(v_num|| ' IS EVEN NUMBER');
   ELSE
      DBMS_OUTPUT.PUT_LINE(v_num||' IS ODD NUMBER');
   END IF;
   
     DBMS_OUTPUT.PUT_LINE('IF THEN ELSE CONSTUCT CONPLETED;');
END;
/
-- IF THEN ELSIF STATMENT
SET SERVEROUTPUT ON;
DECLARE 
   v_city  VARCHAR2(30) := '&city';
BEGIN
   IF v_city = 'Mumbai' THEN
      DBMS_OUTPUT.PUT_LINE('CONTACT TO BMS CORPORATOR.');
   ELSIF v_city = 'Aurangabad' THEN
      DBMS_OUTPUT.PUT_LINE('CONTACT TO AURANGABAD CORPORATION.');
  ELSIF v_city =  'Latur' THEN
      DBMS_OUTPUT.PUT_LINE('CONTACT TO LATUR MUSIPLE CORPORATION.');
  ELSE
     DBMS_OUTPUT.PUT_LINE('SORRY.. ELECTION IS NECCESSORY');
  END IF;
END;
/

-- SIMPLE LOOP
-- SYNTAX
--    LOOP
--      STATEMNTS
--    END LOOP;
DECLARE
   v_counter NUMBER := 0;
   v_result  NUMBER;
BEGIN
   LOOP 
      v_counter := v_counter + 1;
      v_result := 19 * v_counter;
      DBMS_OUTPUT.PUT_LINE(' 19 X '||v_counter||' = '||v_result);
      -- EXIT CONDITION  1
      --IF v_counter >= 10 THEN
      --   EXIT;
      --END IF;
      -- EXIT CONDITION  2
      EXIT WHEN v_counter = 10;
   END LOOP;
END;
/

-- WHILE LOOP
DECLARE
   v_count NUMBER :=1;
   v_result NUMBER;
BEGIN
 WHILE v_count <= 10 LOOP
    v_result := 20 * v_count;
    DBMS_OUTPUT.PUT_LINE('20 X '||v_count||' = '||v_result);
    v_count := v_count + 1;
 END LOOP;
  DBMS_OUTPUT.PUT_LINE('OUTSIDE THE WHILE LOOP.');
END;
/


-- FOR LOOP
-- TWO TYPES OF FOR LOOP
-- 1 NUMERIC FOR LOOP
-- 2 CURSOR FOR LOOP
-- SYNTAX OF NUMERIC FOR LOOP
-- FOR loop_counter IN [REVERSE] lower_limite .. upper_limite LOOP
--    statment1
--    statment2
-- END LOOP;


DECLARE
   v_count NUMBER := 1;
BEGIN
  FOR v_count IN 1 .. 10 LOOP
     DBMS_OUTPUT.PUT_LINE(v_count);
  END LOOP;
END;
/

--REVERS ORDER
BEGIN
  FOR v_counter IN REVERSE 1 .. 10 LOOP
      DBMS_OUTPUT.PUT_LINE(v_counter);
  END LOOP;
END;
/

--                               INTRODUCTION TO TRIGGER

--                     SYNTAX
--   CREATE [OR REPLACE] TRIGGER trigger_name 
--   {befor|after} TRIGGERING EVENT ON table_name
--   [FOR EACH ROW] [FOLLOWS another_trigger_name]
--   [ENABLE|DISABLE] [WHEN CONDITION]
--   DECLARE
--     declaration statments
--   BEGIN
--     Executable statments
--   END;

--                                EXAMPLE
--         1    DATA MANIPULATION TRIGGERS
CREATE TABLE SUPERHEROS(
    sh_name VARCHAR2(30)
);
DESC SUPERHEROS;
-- INSERT DML TRIGGER
CREATE OR REPLACE TRIGGER bi_superheros
BEFORE INSERT ON superheros
FOR EACH ROW
DISABLE
DECLARE
   v_user VARCHAR2 (30);
BEGIN
    SELECT user INTO v_user FROM dual;
  DBMS_OUTPUT.PUT_LINE('You Just Have Inserted One Line Mr.'||v_user);
END;
/

INSERT INTO superheros VALUES('SALMAN KHAN');


-- UPDATE DML TRIGGER
CREATE OR REPLACE TRIGGER ai_superheros
AFTER INSERT ON superheros
FOR EACH ROW
ENABLE
DECLARE
   v_user VARCHAR2(20);
BEGIN
    SELECT user INTO v_user FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('YOU JUST HAVE INSERTED ON LINE MR.'||v_user);
END;
/

CREATE OR REPLACE TRIGGER bu_superheros
BEFORE UPDATE ON superheros
FOR EACH ROW
ENABLE
DECLARE
   v_user VARCHAR2(20);
BEGIN
  SELECT user INTO v_user FROM DUAL;
  DBMS_OUTPUT.PUT_LINE('YOU JUST HAVE UPDATED RECORD MR.'||v_user);
END;
/

UPDATE superheros SET sh_name = 'Sonu Shaikh' WHERE sh_name = 'SALMAN KHAN';

-- ALL DML TRIGGER AT ONE
CREATE OR REPLACE TRIGGER tr_superheros
BEFORE INSERT OR DELETE OR UPDATE ON superheros
FOR EACH ROW
ENABLE
DECLARE
    v_user VARCHAR2(20);
BEGIN
   SELECT USER INTO v_user FROM DUAL;
   
   IF INSERTING THEN
     DBMS_OUTPUT.PUT_LINE('ONE LINE INSERTED BY MR.'||v_user);
   ELSIF DELETING THEN
     DBMS_OUTPUT.PUT_LINE('ONE LINE DELETED BY MR.'||v_user);
   ELSIF UPDATING THEN
     DBMS_OUTPUT.PUT_LINE('ONE LINE UPDATED BY MR.'||v_user);
   END IF;
END ;
/
-- TESTING
INSERT INTO superheros VALUES ('SHITAL');
UPDATE superheros SET sh_name = 'Shital Ragade' WHERE sh_name = 'SHITAL';
DELETE FROM superheros WHERE sh_name = 'Sonu Shaikh';
SELECT * FROM SYSTEM.SH_AUDIT;

-- TABLE AUDITING TRIGGER

CREATE TABLE SH_AUDIT(
   new_name   VARCHAR2(30),
   old_name   VARCHAR2(30),
   user_name  VARCHAR2(30),
   entry_date VARCHAR2(30),
   operation  VARCHAR2(30)
);

CREATE OR REPLACE TRIGGER superheros_audit
AFTER INSERT OR DELETE OR UPDATE ON superheros
FOR EACH ROW
ENABLE
DECLARE 
    v_user VARCHAR2(20);
    v_date VARCHAR2(30);
BEGIN
    SELECT USER,TO_CHAR(sysdate,'DD/MON/YYYY HH24:MI:SS') INTO v_user,v_date FROM dual;
    
    IF INSERTING THEN
       INSERT INTO SH_AUDIT (new_name,old_name,user_name,entry_date,operation)
       VALUES(:NEW.sh_name,NULL,v_user,v_date,'INSERT');
    ELSIF DELETING THEN
       INSERT INTO SH_AUDIT (new_name,old_name,user_name,entry_date,operation)
       VALUES(NULL,:OLD.sh_name,v_user,v_date,'DELETE');
    ELSIF UPDATING THEN
       INSERT INTO SH_AUDIT (new_name,old_name,user_name,entry_date,operation)
       VALUES(:NEW.sh_name,:OLD.sh_name,v_user,v_date,'UPDATE');
    END IF;
END;
/


SELECT * FROM SUPERHEROS;
DELETE FROM SUPERHEROS;
SELECT * FROM SH_AUDIT;
INSERT INTO SUPERHEROS VALUES ('Iron Man');
UPDATE SUPERHEROS SET sh_name ='Tony Stark' WHERE sh_name = 'Iron Man';
DELETE FROM SUPERHEROS WHERE sh_name = 'Tony Stark';

CREATE TABLE SUPERHEROS_BACKUP AS SELECT * FROM SUPERHEROS;
DESC SUPERHEROS_BACKUP;
ALTER TABLE SUPERHEROS_BACKUP ADD user_name VARCHAR2(30);
ALTER TABLE SUPERHEROS_BACKUP ADD op_time VARCHAR2(30);
ALTER TABLE SUPERHEROS_BACKUP ADD operation VARCHAR2(30);

DESC SUPERHEROS_BACKUP;


CREATE TABLE schema_audit(
  ddl_date DATE,
  ddl_user VARCHAR2(20),
  object_created VARCHAR2(100),
  object_name VARCHAR2(200),
  operation VARCHAR2(40)
  
);
DESC schema_audit;
SET SERVEROUTPUT ON;
-- KEEP EYE ON DDL SYSTEM EVENTS ON HR SCHEMA
CREATE OR REPLACE TRIGGER hr_audit_tr
AFTER DDL ON SCHEMA
BEGIN
   INSERT INTO schema_audit VALUES(
   sysdate,
   sys_context('USEREVN','CURRENT_USER'),
   ora_dict_obj_type,
   ora_dict_obj_name,
   ora_sysevent
   );
END;
/
SELECT sys_context('CURRENT_USER') FROM dual;
SELECT * FROM schema_audit;
CREATE TABLE tri_demo ( numbers NUMBER);
INSERT INTO tri_demo (9);
TRUNCATE TABLE tri_demo;
DROP TABLE tri_demo;

CREATE TABLE hr_event_audit(
  event_type VARCHAR2(30),
  login_date DATE,
  login_time VARCHAR2(20),
  logoff_date DATE,
  logoff_time VARCHAR2(20)
);

--USER LOGON AND LOGOFF SCHEMA
CREATE OR REPLACE TRIGGER hr_logon_audit
AFTER LOGON ON SCHEMA
BEGIN
  INSERT INTO hr_event_audit VALUES(
  ora_sysevent,
  sysdate,
  TO_CHAR(sysdate,'hh24:mi:ss'),
  NULL,
  NULL);
  COMMIT;
END;
/
SELECT * FROM hr_event_audit;

-- USER LOGOGG TRIGGER
CREATE OR REPLACE TRIGGER hr_logoff_audit
BEFORE LOGOFF ON SCHEMA
BEGIN
   INSERT INTO hr_event_audit VALUES(
   ora_sysevent,
   NULL,
   NULL,
   sysdate,
   TO_CHAR(sysdate,'hh24:mi:ss')
   );
   COMMIT;
END;
/
SELECT * FROM SYSTEM.database_event_audit WHERE user_name <> 'SYS';

-- INSTED OF TRIGGER
CREATE TABLE TRAINER ( TR_NAME VARCHAR2(30));
CREATE TABLE SUBJECT ( SUBJECT_NAME VARCHAR2(30));
INSERT INTO TRAINER VALUES('Sonu Shaikh');
INSERT INTO SUBJECT VALUES('Oracle');
CREATE OR REPLACE VIEW trainee_subject_vw AS 
SELECT TR_NAME, SUBJECT_NAME FROM TRAINER,SUBJECT;
SELECT * FROM trainee_subject_vw;


INSERT INTO trainee_subject_vw VALUES ('SONU','JAVA');


-- INSTEAD OF INSERT TRIGGER
CREATE OR REPLACE TRIGGER io_instead_tr
INSTEAD OF INSERT ON trainee_subject_vw
FOR EACH ROW
BEGIN
   INSERT INTO trainer VALUES (:NEW.tr_name);
   INSERT INTO subject VALUES (:NEW.subject_name);
END;
/

-- INSTEAD OF UPDATE TRIGGER
CREATE OR REPLACE TRIGGER io_update_tr
INSTEAD OF UPDATE ON trainee_subject_vw
FOR EACH ROW
ENABLE
BEGIN
     UPDATE TRAINER SET tr_name = :NEW.tr_name WHERE tr_name = :OLD.tr_name;
     UPDATE SUBJECT SET subject_name = :NEW.subject_name WHERE subject_name = :OLD.subject_name;
END;
/

SELECT * FROM trainee_subject_vw;
UPDATE trainee_subject_vw SET tr_name = 'Anita Dapke' WHERE tr_name = 'Sonu Shaikh';
-- INSTED OF DELETE TRIGGER
CREATE OR REPLACE TRIGGER io_delete_tr
INSTEAD OF DELETE ON trainee_subject_vw
FOR EACH ROW
ENABLE
BEGIN
    DELETE FROM TRAINER WHERE tr_name = :OLD.tr_name;
    DELETE FROM SUBJECT WHERE subject_name = :OLD.subject_name;
END;
/
DELETE FROM trainee_subject_vw WHERE tr_name = 'SONU';
ROLLBACK;


--                         CURSOR
--          TWO TYPES OF CURSOR  
-- 1. IMPLICITE CURSOR -- PREDEFINE CURSOR
-- 2. EXPLICIT CUSOR  --- USER DEFINE CURSOR
-- SIMPLE EXPLICIT CURSOR
SET SERVEROUTPUT ON;
DECLARE
  v_name VARCHAR2(30);
  CURSOR im_cursor1 IS 
  SELECT first_name FROM EMPLOYEES WHERE employee_id <= 105;
BEGIN
   OPEN im_cursor1;
   LOOP
     FETCH im_cursor1 INTO v_name;
     DBMS_OUTPUT.PUT_LINE(v_name);
     EXIT WHEN im_cursor1%NOTFOUND;
   END LOOP;
   CLOSE im_cursor1;
END;
/
-- PARAMETERIZED CURSOR
DECLARE 
   v_name VARCHAR2(30);
   v_last VARCHAR2(30);
   CURSOR param_cursor(var_e_id VARCHAR2,var_e_sal NUMBER) IS
   SELECT first_name,last_name FROM employees WHERE employee_id <= var_e_id AND salary >= var_e_sal;
BEGIN
   OPEN param_cursor(105,15000);
   LOOP
       FETCH param_cursor INTO v_name,v_last;
       EXIT WHEN param_cursor%NOTFOUND;
       DBMS_OUTPUT.PUT_LINE('Mr.'||v_last||' '||v_name);
   END LOOP;
   CLOSE param_cursor;
END;
/
-- PARAMETERIZED CURSOR WITH DEFAULT VALUE
DECLARE
   v_name VARCHAR2(30);
   v_id   NUMBER;
   CURSOR param_cursor_df(var_e_id VARCHAR2 := 190) IS 
   SELECT first_name,employee_id FROM EMPLOYEES WHERE employee_id > var_e_id;
BEGIN
  OPEN param_cursor_df(200);
  LOOP 
     FETCH param_cursor_df INTO v_name,v_id;
     EXIT WHEN param_cursor_df%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(v_name||' '||v_id);
  END LOOP;
  CLOSE param_cursor_df;
END;
/


-- CURSOR FOR LOOP
DECLARE
 v_fname VARCHAR2(30);
 v_lname VARCHAR2(30);
 CURSOR cursor_for_loop IS 
 SELECT first_name,last_name FROM employees WHERE employee_id > 200;
BEGIN
   FOR L_IDX IN cursor_for_loop 
     LOOP 
        DBMS_OUTPUT.PUT_LINE(L_IDX.first_name||' '||L_IDX.last_name);
     END LOOP;
END;
/

-- CURSOR FOR LOOP WITH PARAMETERS
DECLARE
 v_fname VARCHAR2(30);
 v_lname VARCHAR2(30);
 CURSOR cursor_for_loop(var_e_id VARCHAR2) IS 
 SELECT first_name,last_name FROM employees WHERE employee_id > var_e_id;
BEGIN
   FOR L_IDX IN cursor_for_loop(190) 
     LOOP 
        DBMS_OUTPUT.PUT_LINE(L_IDX.first_name||' '||L_IDX.last_name);
     END LOOP;
END;
/
 --            RECORDS
 --- 1. TABLE BASED RECORD
 -- FETCH DATA FROM WHOLE TABLE
 SET SERVEROUTPUT ON;
DECLARE
    v_emp EMPLOYEES%ROWTYPE ;
BEGIN
   SELECT * INTO v_emp FROM employees WHERE employee_id = 200;
   DBMS_OUTPUT.PUT_LINE(v_emp.first_name||' has salary $'||v_emp.salary||' /month');
END;
/
-- FETCH DATA FROM SELECTED TABLE FIELDS
DECLARE
    v_emp employees%ROWTYPE;
BEGIN
    SELECT first_name,hire_date INTO v_emp.first_name,v_emp.hire_date FROM employees WHERE employee_id = 100;
    DBMS_OUTPUT.PUT_LINE(v_emp.first_name||'`s Joinig date is '||v_emp.hire_date);
END;
/

--2. CURSOR TYPE RECORDS
DECLARE
   CURSOR cur_type_record IS 
    SELECT first_name,last_name FROM employees WHERE employee_id = 200;
    v_emp cur_type_record%ROWTYPE;
BEGIN
   OPEN cur_type_record;
   FETCH cur_type_record INTO v_emp;
   DBMS_OUTPUT.PUT_LINE(v_emp.first_name||' '||v_emp.last_name);
   CLOSE cur_type_record;
END;
/
-- CURSOR TYPE RECORDS FETCHING MULTIPLE VALUES
DECLARE
   CURSOR cur_type_record IS
    SELECT first_name,salary FROM employees WHERE employee_Id < 105;
    
    var_emp cur_type_record%ROWTYPE;
BEGIN
  OPEN cur_type_record;
  LOOP 
    FETCH cur_type_record INTO var_emp;
    DBMS_OUTPUT.PUT_LINE(var_emp.first_name||' '||var_emp.salary);
    EXIT WHEN cur_type_record%NOTFOUND;
  END LOOP;
  CLOSE cur_type_record;
END;
/
--3 USER DEFINE RECORD
DECLARE
   TYPE rv_type IS RECORD(
     f_name VARCHAR2(20),
     d_name DEPARTMENTS.department_name%TYPE
   );
   var1 rv_type;
BEGIN
    SELECT first_name,department_name INTO var1.f_name , var1.d_name
    FROM employees JOIN DEPARTMENTS USING (DEPARTMENT_ID) WHERE employee_Id = 100;
    DBMS_OUTPUT.PUT_LINE(var1.f_name||' Works In `'||var1.d_name||'` Department');
END;
/
-- example2
DECLARE
  TYPE ud_record IS RECORD(
    f_name EMPLOYEES.first_name%TYPE,
    salary EMPLOYEES.salary%TYPE,
    d_name DEPARTMENTS.department_name%TYPE
  );
    var1 ud_record;
BEGIN
   SELECT first_name,salary,department_name INTO var1.f_name,var1.salary,var1.d_name
   FROM employees e, departments d WHERE e.department_id = d.department_id AND e.employee_id = 100;
   DBMS_OUTPUT.PUT_LINE(var1.f_name||' Work In '||var1.d_name||' And Having Salary '||var1.salary);
END;
/

--             FUNCTIONS
-- FUNCTION TO CALCULATE THE AREA OF THE CIRCLE
CREATE OR REPLACE FUNCTION circle_area(radius NUMBER) 
RETURN NUMBER IS

pi CONSTANT NUMBER(7,2) :=3.14;
area NUMBER(7,2);
BEGIN
   area := pi * (radius * radius);
  RETURN area;
END;
/
-- ACCESS THE ciracle_area FUNCTION
BEGIN
    DBMS_OUTPUT.PUT_LINE(circle_area(5));
END;
/

DECLARE 
   v_radius NUMBER :=&radius;
BEGIN
   DBMS_OUTPUT.PUT_LINE('THE AREA OF THE CIRCLE HAVING RADIUS '||v_radius||' IS '||circle_area(v_radius)||' SQ/METER');
END;
/
-- EXAMPLE 2
-- CALCULATE SPEED OF CAR
CREATE OR REPLACE FUNCTION speed_of_car( distance NUMBER, v_time NUMBER)
RETURN NUMBER IS

v_speed NUMBER;
BEGIN
   -- v_time  := 60 * v_time;
    v_speed := (distance / v_time);
    RETURN v_speed;
END;
/

DECLARE
   v_time NUMBER :=&time_In_Minuts;
   v_distance NUMBER :=&distance_In_Meters;
   v_result NUMBER;
BEGIN
     v_result := speed_of_car(v_distance,v_time);
     DBMS_OUTPUT.PUT_LINE('The speed of car is '||v_result||' METER/SECOND');
END;
/
-- STORED PROCEDURE 
-- SIMPLE STORED PROCEDURES
CREATE OR REPLACE PROCEDURE pr_sonumonu IS
   var_name VARCHAR2(30) := 'Sonu Shaikh';
   var_age  VARCHAR2(30) := '20';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Hello '||var_name||' You Are '||var_age||' Year Old..');
END;
/
-- EXECUTING PROCEDURE
--STEP 1
EXEC pr_sonumonu;
EXECUTE pr_sonumonu;
-- STORED PROCEDURE WITH PARAMETERS
CREATE OR REPLACE PROCEDURE emp_saL (emp_n VARCHAR2,sal_raise NUMBER) IS

BEGIN
    UPDATE emp_salary SET salary = salary * sal_raise WHERE emp_name = emp_n;
    --INSERT INTO emp_salary VALUES (emp_n,sal_raise);
    COMMIT;
END;
/
 EXEC emp_sal('Sonu',220000);
 
select * from emp_salary;
-- FIND OUT THRIED HIGHEST PAID EMPLOYEE
SELECT first_name, salary FROM EMPLOYEES ORDER BY salary DESC;

CREATE OR REPLACE PROCEDURE highest_salary IS
v_salary NUMBER;

BEGIN
    SELECT MAX(salary) INTO v_salary FROM employees;
    SELECT salary FROM employees WHERE salary < v_salary;
    DBMS_OUTPUT.PUT_LINE('Max Salary is '||v_salary);
END;
/
EXEC highest_salary;
SET SERVEROUTPUT ON;
select first_name,salary from EMPLOYEES where salary < (select max(salary) from EMPLOYEES) order by salary DESC;
SELECT SALARY FROM employees order by salary,desc , first_name asc;
-- CALLING NOTATIONS FOR FUNCTION AND PROCEDURES
CREATE TABLE Email (
  first_name VARCHAR2(30),
  last_name VARCHAR2(30),
  email   VARCHAR2(255),
  password VARCHAR2(40)
  );
CREATE OR REPLACE PROCEDURE insert_email(fname VARCHAR2 DEFAULT NULL,lname VARCHAR2 DEFAULT NULL,email VARCHAR2,pass VARCHAR2) IS
BEGIN
   INSERT INTO Email(first_name,last_name,email,password) VALUES(fname,lname,email,pass);
   DBMS_OUTPUT.PUT_LINE('Record Inserted Successfuly');
   COMMIT;
END;
/
-- 1 POSITIONAL NOTATION
EXECUTE insert_email('Sonu','Shaikh','Sonu@gmail.com','SOnu786');
-- 2 NAMING NOTATIONAL
BEGIN
    insert_email(email=>'Sonu@gmail.com',pass=>'Sonu@786');
END;
/
SELECT * FROM Email;

-- PACKAGE IN ORACLE PL-SQL
--   PACKAGE HEADER
CREATE OR REPLACE PACKAGE pkg_sonushaikh IS
 --FUNCTION print_strng RETURN VARCHAR2;
 PROCEDURE insert_data(fname VARCHAR2,lname VARCHAR2,email VARCHAR2,pass VARCHAR2);
END pkg_sonushaikh;
/

-- PACKAGE BODY
CREATE OR REPLACE PACKAGE BODY pkg_sonushaikh IS
  -- FUNCTION IMPLEMENTION
  
  
  -- PROCEDURE IMPLEMENTATION
   PROCEDURE insert_data(fname VARCHAR2,lname VARCHAR2,email VARCHAR2,pass VARCHAR2) IS
     BEGIN
       INSERT INTO EMAIL VALUES(fname,lname,email,pass);
       DBMS_OUTPUT.PUT_LINE('Record Inserted Succefuly');
     END insert_data;
END pkg_sonushaikh;
/

SELECT * FROM EMAIL;
BEGIN
   pkg_sonushaikh.insert_data('Anita','Dapke','Dapkeanita@gmail.com','Gmail@anita');
END;
/
-- EXAMPLE2
CREATE OR REPLACE PACKAGE pkg_shaikh IS
  FUNCTION fun_display RETURN VARCHAR2;
  PROCEDURE pr_dislay ;
END;
/
CREATE OR REPLACE PACKAGE BODY pkg_shaikh IS
 FUNCTION fun_display  RETURN VARCHAR2 IS
    BEGIN
         RETURN 'HELLO...! YOU SUCCESSFULY COMPLIED.';
    END;

 
 PROCEDURE pr_dislay IS
     BEGIN
         DBMS_OUTPUT.PUT_LINE('HELLO...! PROCEDURE DATA DISPLAY');
      END pr_dislay;
END pkg_shaikh;
/

BEGIN
   DBMS_OUTPUT.PUT_LINE(pkg_shaikh.fun_display);
   pkg_shaikh.pr_dislay;
END;

/

--           EXCEPTIONS

--   TWO TYPE OF EXCEPTIONS
-- 1.SYSTEM DEFINE EXCEPTION
-- 2.USER DEFINE EXCEPTION

-- DEFINE IN THREE WAYS

-- 1.  EXCEPTION datatype RAISE statment
--    Declaring user define exception by declaring of EXCEPTION datatype in your code.
--    Raise it explicitly in your program using RAISE statment


-- 2.using PREGMA EXCEPTION_INIT function
--  we can map a non predefined error number with variable of EXCEPTION datatype. 

--2. using RAISE_APPLICATION_ERROR method
-- using this method we define use define exception with custome messege and error number.


-- DEFINING EXEPTION USING EXCEPTION VARIABLE
DECLARE
     var_devident NUMBER := &DEVIDENT;
     var_devisor NUMBER  :=  &DEVISOR;
     var_result NUMBER;
     ex_DivZero EXCEPTION;
BEGIN
   IF  var_devisor = 0 THEN
      RAISE ex_DivZero;
   END IF;
  var_result := var_devident / var_devisor;
  DBMS_OUTPUT.PUT_LINE('Result = ' || var_result);
  
  EXCEPTION WHEN ex_DivZero THEN
     DBMS_OUTPUT.PUT_LINE('You Can not Devide By Zero');
END;
/
-- example 2
DECLARE
    var_age NUMBER := &AGE;
    ex_overage EXCEPTION;
BEGIN
    IF var_age < 18 THEN
       RAISE ex_overage;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Welcome...!');
    EXCEPTION WHEN ex_overage THEN
      DBMS_OUTPUT.PUT_LINE(' ERROR ERROR!: You Are Under Age');
END;
/

-- DEFINING EXEPTION USING RAISE_APLLICTION_ERROR
ACCEPT var_age NUMBER PROMPT 'Tell Me Your Age...!!';
DECLARE
   age NUMBER := &var_age;
BEGIN
   IF  age < 18 THEN
      RAISE_APPLICATION_ERROR(-20099,'You Should be 18 or above To DRINK');
   END IF;
   
   DBMS_OUTPUT.PUT_LINE('Sure...! What Would You like to have ??');
   
   EXCEPTION WHEN otherS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/ 

-- EXAPLE 2
ACCEPT v_name VARCHAR2 PROMPT 'What is your name???';
DECLARE
   name VARCHAR2(30) := '&v_name';
   var_len NUMBER;
BEGIN
   SELECT LENGTH(name) INTO var_len FROM DUAL;
   
   IF var_len < 5 THEN
      RAISE_APPLICATION_ERROR(-20050,'Your Password Should Be Longer Than Five Charactes');
   END IF;
    DBMS_OUTPUT.PUT_LINE('Strong Password');
    EXCEPTION WHEN others THEN
       DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
-- PRAGAM EXCEPTION_INIT FUNCTION
ACCEPT var_age NUMBER PROMPT 'TELL ME YOUR AGE';
DECLARE
  ex_age EXCEPTION;
  age NUMBER := &var_age;
  PRAGMA EXCEPTION_INIT(ex_age,-20008);
BEGIN
  IF age < 18 THEN
     RAISE_APPLICATION_ERROR(-20008,'Your Age Should Be Greater Than 18');
  END IF;
  
  DBMS_OUTPUT.PUT_LINE('GREATE...!');
 EXCEPTION WHEN ex_age THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

-- COLLECTION IS PL-SQL
-- Syntax of Nested Table
-- TYPE nested_table_name TABLE OF element_type [NOT NULLL];

DECLARE
   TYPE my_nested_table IS TABLE OF NUMBER;
   var_nt my_nested_table := my_nested_table(11,22,33,44,55,66,77,88,99,00);
BEGIN
  DBMS_OUTPUT.PUT_LINE('VALUE STORED AT INDEX 1 '|| var_nt(1));
END;
/
-- DISPLAY WHOLE COLLETION
DECLARE
  TYPE my_nested_table IS TABLE OF NUMBER;
  v_nt my_nested_table := my_nested_table (11,22,33,44,55,66,77,88,99,00);
BEGIN
    FOR i IN 1.. v_nt.COUNT LOOP
       DBMS_OUTPUT.PUT_LINE('VALUE STORED AT INDEX '||i||' IS '||v_nt(i));
    END LOOP;
END;
/