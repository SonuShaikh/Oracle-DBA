--CONTROL STATMENTS
-- THERE ARE TWO TYPE OF CONTROL STATEMENTS
-- 1. IF STATEMENTS
--    A. IF THEN
--    B. IF THEN ELSE
--    C. IF THEN ELSEIF
-- 2. CASE STATEMENTS
--    A. SIMAPLE CASE EXPRESSION
--    B. SEARCH CASE EXPRESSION.

--******* IF THEN STATEMENT ********--
-- SYNTAX
-- IF CONDITION THEN
-- STATE1
-- STATE 2
-- END IF;

-- EXAMPLE
DECLARE
   v_age NUMBER :=18;
BEGIN
    IF( v_age >= 18) THEN
        DBMS_OUTPUT.PUT_LINE('YOUR ARE A ADULT');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('OUTSIDE THE WORLD');
END;
/

