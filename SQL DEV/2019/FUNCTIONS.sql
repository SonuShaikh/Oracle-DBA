--FUNCTIONS IN ORACLE
SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION fun_AreOfCircle(radius Number)
RETURN NUMBER IS
    var_pi CONSTANT NUMBER := 3.14;
    var_area NUMBER;
BEGIN
    --AREA OF CIRCLE 2*PI*PI;
    var_area := 2 * var_pi * var_pi;
    RETURN var_area;
END;
/

-- CALLING FUNCTION
BEGIN
 DBMS_OUTPUT.PUT_LINE('The Area Of The Circle Is '||fun_AreOfCircle(5));
END;
/

-- CALLING FUNCTION
DECLARE
    vr_area NUMBER;
BEGIN
    vr_area := fun_AreOfCircle(15);
    
    DBMS_OUTPUT.PUT_LINE('THE AREA OF CIRCLE IS '||vr_area);
END;
/

BEGIN 
  DBMS_OUTPUT.PUT_LINE(15*3.14*3.14);
END;
/
-- SQUARE ROOT OF NUMBER
CREATE OR REPLACE FUNCTION sqrt_num(num NUMBER)
RETURN NUMBER IS 
BEGIN
    RETURN num * num;
END;
/

BEGIN
 DBMS_OUTPUT.PUT_LINE(sqrt_num(10));
END;
/


-- CALLING NOTATIONS
CREATE OR REPLACE FUNCTION fun_callNot(var_num1 NUMBER,var_num2 NUMBER := 0,var_num3 NUMBER ) RETURN NUMBER IS
BEGIN
    RETURN var_num1 + var_num2 + var_num3;
END;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE(fun_callNot(var_num1 => 12,var_num3 => 30 ));
END;
/





