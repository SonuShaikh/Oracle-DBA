-- EXAMPLE 1 IF 
SET SERVEROUTPUT ON;
DECLARE 
V_Name VARCHAR2(20) := 'Sonu';
BEGIN
IF V_Name = 'sonu' THEN
DBMS_OUTPUT.PUT_LINE('lOG IN SUCCESSFULL');
END IF ;
DBMS_OUTPUT.PUT_LINE('INVALID USER NAME');
END ;
/


SET SERVEROUTPUT ON;
DECLARE
v_mail VARCHAR2(40) := 'sonu.shaikh.9028@gmail.com';
v_password NUMBER := 9623858600;
BEGIN
IF v_mail = 'sonu.shaikh.9028@gmail.com' AND v_password = 9623858600 THEN
DBMS_OUTPUT.PUT_LINE('LOG IN SUCCESSFUL');
END IF;
DBMS_OUTPUT.PUT_LINE('LOGIN FAILED');
END;
/










SET SERVEROUTPUT ON;
DECLARE 
v_num NUMBER(3) := 9;
BEGIN
IF v_num < 10 THEN
DBMS_OUTPUT.PUT_LINE('NUMBER IS SMALLER THAN 10');
END IF ;
DBMS_OUTPUT.PUT_LINE('OUT O F THE IF STATEMENT');
END;
/



-- IF ELSE STATMENT
SET SERVEROUTPUT ON;


DECLARE
v_num NUMBER := &enter_NUM;
BEGIN
IF MOD(v_num,2) = 0 THEN
DBMS_OUTPUT.PUT_LINE( v_num ||' Is Even NUMBER');
ELSE 
DBMS_OUTPUT.PUT_LINE( v_num || 'Is Odd Number');
END IF;
DBMS_OUTPUT.PUT_LINE('HELLO');
END;
/
SET SERVEROUTPUT ON;
DECLARE
v_name VARCHAR2(20) := '&ENTERnAME';
BEGIN
IF v_name = 'SONU' THEN
DBMS_OUTPUT.PUT_LINE('HELLO SONU');
ELSE 
DBMS_OUTPUT.PUT_LINE('I DO NOT KNOW YOU');
END IF;
DBMS_OUTPUT.PUT_LINE('THANK YOU');
END;
/


-- elseif else
SET SERVEROUTPUT ON;
DECLARE 
v_city VARCHAR2(30) := '&entercITY';
BEGIN 
IF v_city = 'Mumbai' THEN
DBMS_OUTPUT.PUT_LINE(v_city ||' is Capital of india');
ELSIF v_city = 'Washington' THEN
DBMS_OUTPUT.PUT_LINE(v_city || ' Is Capital of USA');
ELSIF v_city = 'Dubai' THEN
DBMS_OUTPUT.PUT_LINE(v_city || ' is CAPITAL OF UAE');
ELSE 
DBMS_OUTPUT.PUT_LINE('PLEASE INTER THE VALID CAPITAL');
END IF ;
DBMS_OUTPUT.PUT_LINE('THANK YOU ....!!!!');
END ;
/


SET SERVEROUTPUT ON;
DECLARE 
v_num NUMBER := 0;
v_result NUMBER;
BEGIN
LOOP
 v_num := v_num+1;
 v_result := 19 * v_num;
 
 DBMS_OUTPUT.PUT_LINE(' 19 ' ||'x'|| v_num ||' = '|| v_result);
 IF v_num = 10 then
 EXIT;
 END IF; 
 END LOOP;
 END;
/

SET SERVEROUTPUT ON;
DECLARE
v_counter NUMBER := 0;
v_result NUMBER;
BEGIN
LOOP
v_counter := v_counter+ 1;
v_result := v_counter;
DBMS_OUTPUT.PUT_LINE(v_counter);
EXIT WHEN v_counter = 20;
END LOOP;
END;
/





-- WHILE LOOP EXAMPLE 1
SET SERVEROUTPUT ON;
DECLARE 
v_num NUMBER := 1;
v_result NUMBER;
BEGIN
WHILE v_num <= 10 LOOP
v_result := 19 * v_num;
DBMS_OUTPUT.PUT_LINE('19 ' || 'X' ||v_num|| '='|| v_result);
v_num := v_num+1;
 END LOOP;
 END;
 /


-- TRUE CONDITION EXAMPLE 2
SET SERVEROUTPUT ON;
DECLARE
v_num NUMBER := 0;
v_test BOOLEAN := TRUE;
BEGIN
WHILE v_test LOOP

v_num := v_num +1;
DBMS_OUTPUT.PUT_LINE(v_num);
  IF v_num = 10 THEN
  v_test := FALSE;
  END IF;
   END LOOP;
    DBMS_OUTPUT.PUT_LINE('OUT SIDE THE LOOP');
    END;
    /
    
    
    -- FOR LOOP EXAMPLE
    SET SERVEROUTPUT ON;
    DECLARE 
    v_result NUMBER ;
    BEGIN
    FOR v_counter IN  REVERSE 1 .. 10 LOOP
    v_result := 12*v_counter;
    DBMS_OUTPUT.PUT_LINE('12' || ' x '|| v_counter || ' = ' || v_result);
    END LOOP;
    END;
    /
    








