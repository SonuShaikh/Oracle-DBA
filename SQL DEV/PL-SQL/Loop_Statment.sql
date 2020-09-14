-- LOOPING STATMENT (ITARATIVE LOOP ) SERIES
--                                         1st LOOP : SIMPLE LOOP
SET SERVEROUTPUT ON;
DECLARE
    v_counter NUMBER :=0;
    v_result NUMBER;
BEGIN
   LOOP
        v_counter := v_counter + 1;
       v_result := v_counter * 19;
       DBMS_OUTPUT.PUT_LINE('19 X '||v_counter || ' = ' ||v_result);
       --IF v_counter >= 10 THEN
         --  EXIT;
       --END IF;
       EXIT WHEN v_counter >= 10;
   END LOOP;
END;
/

--                                            2nd LOOP: WHILE LOOP 

DECLARE
   v_counter NUMBER :=1;
   v_result NUMBER;
BEGIN
     WHILE v_counter <= 10 LOOP
       v_result := 19 * v_counter;
       DBMS_OUTPUT.PUT_LINE('19 X '||v_counter||' = '|| v_result);
       v_counter := v_counter + 1;
     END LOOP;
END;
/

DECLARE 
      v_counter NUMBER := 0;
      v_bool BOOLEAN := TRUE;
BEGIN
    WHILE v_bool LOOP
        DBMS_OUTPUT.PUT_LINE(v_counter);
        v_counter := v_counter + 1;
        IF v_counter = 50 THEN
            v_bool := FALSE;
        END IF;
    END LOOP;
END;
/

DECLARE
    v_counter NUMBER := 1;
    v_result NUMBER;
    v_test BOOLEAN := TRUE;
BEGIN
    WHILE v_test LOOP
       v_result := v_counter * 20;
       DBMS_OUTPUT.PUT_LINE(' 20 * ' ||v_counter||' = '||v_result);
       v_counter := v_counter + 1;
       IF v_counter = 11 THEN
          EXIT;
       END IF;
   END LOOP;
END ;
/


--                                         3rd LOOP: FOR LOOP
BEGIN
     FOR v_counter IN 1 .. 10 LOOP
         DBMS_OUTPUT.PUT_LINE(v_counter);
     END LOOP;
END;
/
BEGIN 
     FOR v_counter IN REVERSE 1 .. 10 LOOP
          DBMS_OUTPUT.PUT_LINE(v_counter);     
     END LOOP;
END;
/
DECLARE
    v_result NUMBER ;
BEGIN
    FOR v_counter IN 1 .. 10 LOOP
       v_result := 14 * v_counter;
       DBMS_OUTPUT.PUT_LINE('14 X '||v_counter||' = '||v_result);
    END LOOP;
END;
/ 
