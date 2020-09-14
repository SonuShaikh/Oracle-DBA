-- COLLECTION IN PL/SQ
SET SERVEROUTPUT ON;
-- 1 NESTED TABLE
DECLARE
    TYPE my_nested_table IS TABLE OF NUMBER;
    var_nt my_nested_table := my_nested_table(10,55,66,88,12,69,54,75,36,8,95,56);
    
BEGIN
    FOR indx IN 1.. var_nt.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Value at index '||indx||' is '||var_nt(indx));
    END LOOP;
    
END;
/

--EXAMPLE 2
DECLARE
    TYPE my_nested_table2 IS TABLE OF VARCHAR2(100);
    var_nt my_nested_table2 := my_nested_table2();
BEGIN
        var_nt.EXTEND(4); -- we have to extend the table before using it with number insertion
        
        var_nt(1) := 'sonu';
        var_nt(2) := 'pappu';
        var_nt(3) := 'shah';
        var_nt(4) := 'shaikh';
        --var_nt(6) := 'random';
    
    FOR indx IN 1.. var_nt.COUNT LOOP 
        DBMS_OUTPUT.PUT_LINE(var_nt(indx));
    END LOOP;
END;
/

--VARRAYS:
DECLARE
     TYPE  inBlock_vry IS VARRAY(10)   OF NUMBER;
     vry_obj inBlock_vry := inBlock_vry();
    
BEGIN
    vry_obj.EXTEND(10);
    
    FOR indx IN 1.. 10 LOOP
    vry_obj(indx) := 10*indx;
    DBMS_OUTPUT.PUT_LINE(vry_obj(indx));
    END LOOP;
END;
/

-- VARRAY AS DATABAE OBJECT

CREATE OR REPLACE TYPE DbOjb_vry  IS VARRAY(5) OF NUMBER;
/
CREATE TABLE calender(
  day_name VARCHAR2(30),
  day_date DbOjb_vry
);
    
DESC calender;

-- INSER VALUE IN TABLE
INSERT INTO calender VALUES ('Sunday', DbOjb_vry (7,14,21,28));

--SELECT VALUES FROM TABLE
SELECT * FROM calender;

-- Display values with Table Expression
SELECT 
    tab1.day_name,
    vray.column_value AS day_date
FROM calender tab1, TABLE ( tab1.day_date) vray;

-- ASSOCITIVE ARRAYS;
DECLARE
    TYPE books IS TABLE OF NUMBER 
    INDEX BY VARCHAR2(30);
    
    isbn books;
    
BEGIN
    isbn('OracleDatabase') := 1234;
    isbn('Java') := 020;
    isbn('DataScience') := 1010;
    
    DBMS_OUTPUT.PUT_LINE('values '|| isbn('OracleDatabase'));
END;
/

-- EXERCISE
/*
Create an Associative array of character datatype and index it by number and perform
the below operations.
? Insert 10 values into this array
? Delete 3rd element from the array
? Delete 7th element from the array
? Display the data from the array
*/

DECLARE
    TYPE ass_ray IS TABLE OF VARCHAR2(30)
    INDEX BY BINARY_INTEGER ;
    
    var_arry ass_ray;
    indx NUMBER :=1;
BEGIN
    
        var_arry (1) := 'Apple';
        var_arry(2) := 'Ball';
        var_arry(3) := 'Cat';
        var_arry(4) := 'Dog';
        var_arry(5) := 'Elephanent';
        var_arry(6) := 'Fish';
        var_arry(7) := 'Gen';
        var_arry(8) := 'Hen';
        var_arry(9) := 'Icecreame';
        var_arry(10) := 'Joker';
        
        
        var_arry.DELETE(3);
        var_arry.DELETE(7);
        
      indx := var_arry.FIRST;
        WHILE indx IS NOT NULL LOOP
            DBMS_OUTPUT.PUT_LINE(var_arry(indx));
            indx := var_arry.NEXT(indx);
        END LOOP;
END;
/

/*
Example 2
Create a Nested Table array of character datatype and perform the below operations.
? Insert 10 values into this array
? Delete 3rd element from the array
? Delete 7th element from the array
? Display the data from the array
*/

DECLARE 
 TYPE nt_tbl IS  TABLE OF VARCHAR2(30);
 nt_obj nt_tbl := nt_tbl('Apple','Ball','Cat','Dog','Elephanent','Fish','Gen','Hen','Icecreame','Joker');

BEGIN        
    nt_obj.EXTEND;
    nt_obj(11) :='Sonu';
    
   -- nt_obj.DELETE(3);
    
        FOR indx IN 1.. nt_obj.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('Value at index '||indx||' is '||nt_obj(indx));
        END LOOP;
END;
/











    
    
    
    
    
    
    
    