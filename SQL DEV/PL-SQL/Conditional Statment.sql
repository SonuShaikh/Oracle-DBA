-- CONDITIONAL CONTROL STATMENT SERIES.
-- TUTORIAL - 8 IF THEN STATMENT
-- EXMAPLE-1
SET SERVEROUTPUT ON;
DECLARE
    v_num1 NUMBER(2) := 10;
    v_num2 NUMBER(2) := 20;
BEGIN
    IF v_num1 < v_num2 THEN
        DBMS_OUTPUT.PUT_LINE(v_num1 || ' IS SMALLER THAN '||v_num2);
    END IF;
        DBMS_OUTPUT.PUT_LINE(' HELLO WORLD ');
END;
/

-- EXMPLE-2
DECLARE 
      v_name VARCHAR2(20) :='Sonu';
      v_pass VARCHAR2(10) :='PASS';
BEGIN
   IF v_name ='Sonu' AND v_pass = 'PASS' THEN
      DBMS_OUTPUT.PUT_LINE('HELLO '||v_name||' YOU LOGGED IN SUCCESSFULY WITH PASSWORD '||v_pass);
   END IF;
      DBMS_OUTPUT.PUT_LINE('FACEBOOK DATABASE');
END;
/

-- TUTORIAL-9 IF THEN ELSE
DECLARE 
    v_number NUMBER := &num;
BEGIN
   IF MOD(v_number,2) = 0 THEN
       DBMS_OUTPUT.PUT_LINE(v_number||' IS EVEN ');
   ELSE
       DBMS_OUTPUT.PUT_LINE(v_number||' IS ODD ');
  END IF;
   DBMS_OUTPUT.PUT_LINE(' TASK COMPLETED ');
END;
/
-- TUTORIAL-10 IF THEN ELSIF ELSE END IF
DECLARE
    v_city VARCHAR2(20) := '&city';
BEGIN
   IF v_city = 'Mumbai' THEN
      DBMS_OUTPUT.PUT_LINE(v_city||' is protected by sonu shaikh');
   ELSIF v_city = 'Pune' THEN
      DBMS_OUTPUT.PUT_LINE(v_city||' is protected by Bazirao');
   ELSIF v_city = 'Aurangabad' THEN
      DBMS_OUTPUT.PUT_LINE(v_city||' is protected by Mughal');
   ELSIF v_city = 'Chennai' THEN
      DBMS_OUTPUT.PUT_LINE(v_city||' is protected by Rajni');
   ELSE
      DBMS_OUTPUT.PUT_LINE('YOU SHOULD HAVE TO CALL AVANAGERS.');
   END IF;
END;
/