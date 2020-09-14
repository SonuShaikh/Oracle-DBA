CREATE OR REPLACE FUNCTION circle_redius (redius NUMBER)
RETURN NUMBER IS
pi CONSTANT NUMBER(7,3):=3.14;
area NUMBER(7,3);
BEGIN
    area := pi * (redius * redius);
    return area;
END;
/
SET SERVEROUTPUT ON;
BEGIN
    DBMS_OUTPUT.PUT_LINE(circle_redius(5));
END;
/
DECLARE
    v_result NUMBER ;
BEGIN
    v_result := circle_redius(20);
    DBMS_OUTPUT.PUT_LINE(v_result);
END;
/


CREATE TABLE s1(
  roll1 NUMBER,
  name VARCHAR(20)
  );
CREATE TABLE s2(
roll1   NUMBER,
div VARCHAR(30));

CREATE TABLE s3 (
roll1 NUMBER,
gf_bf VARCHAR2(20));

INSERT INTO s1 values(1,'Sonu');
INSERT INTO s2 values(1,'A');
INSERT INTO s3 VALUES(1,'Anita');
SELECT s1.roll1,name,div,gf_bf FROM s1,s2,s3 WHERE s1.roll1 = s2.roll1 AND s1.roll1 = 1;
drop TABLE s3;