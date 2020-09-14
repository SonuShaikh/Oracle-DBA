-- Company Table
  CREATE TABLE company
  (
   product_id VARCHAR2(10),
   company_name VARCHAR2(20)
   );
   
   INSERT INTO company VALUES ('&product_id','&comp_name');
   
   SELECT * FROM company;
-- Case Expression
-- Two type of Search Expression
-- type:1 SIMPLE CASE EXPRESSION
SELECT
(
  CASE 'Dog'
  WHEN 'Cat' THEN 'Kitten'
  WHEN 'Dog' THEN 'HWOFF'
  WHEN 'Cow' THEN 'Humm'
  WHEN 'Dog' THEN 'Roff'
  ELSE 'SORRY'
  END) AS Case_Expression
  FROM dual;
  
  
   -- Case Expression with column level
   SELECT product_id,company_name,
   (
   CASE product_Id
   WHEN 'P1' THEN 'Steve Jobs'
   WHEN 'P2' THEN 'Bill Gates'
   WHEN 'P3' THEN 'Ambani Sons'
   WHEN 'P4' THEN 'Mark Zukarbark'
   WHEN 'P5' THEN 'Sundar Pinchai'
   ELSE 'Unknown '
   END ) As Owners
   FROM company;
   
   -- CREATE A TABLE NAMES
   CREATE TABLE NAMES 
   (
    first_name VARCHAR2(20),
    last_name VARCHAR2(20)
    );
    INSERT INTO names VALUES('&first_name','&last_name');
    SELECT * FROM names;
   
   --TYPE 2: SEARCH CASE EXPRESSIONS
    
    SELECT first_name,last_name,
   ( CASE 
        WHEN first_name = 'Sonu'   AND last_name ='Shaikh'     THEN '9623858600'
        WHEN first_name = 'Anita'  AND last_name ='Dapke'      THEN '8983806004'
        WHEN first_name = 'Mayur'  AND last_name = 'Pathrikar' THEN '1234567890'
        WHEN first_name = 'Ashish' AND last_name = 'Balid'     THEN '8446332772'
        ELSE     'SORRY'
    END) AS phone_number
    FROM names;
   
  --SERCH CASE EXPRESSION WITH comparision operator and BETWEEN operator and IN Operator
  SELECT first_name,salary,
  ( 
  CASE
  WHEN salary <=9000 THEN 'case1'
  WHEN last_name = 'King' AND manager_id IS NULL THEN 'case2'
  WHEN salary BETWEEN 10000 AND 13000 THEN 'case3'
  WHEN salary IN (14000,17000,24000) THEN 'case4'
  ELSE 'SORRY'
  END ) As Cases
  FROM HR.employees 
  WHERE salary >= 8500;
  
  -- DECODE FUNCTION
  --Query 1: Simple Decode function
  SELECT DECODE('sonu','sonu','True. String Matches','False. String Do Not Matches') FROM dual;
  
 CREATE TABLE GuessTheCapital
  (
    country_name varchar2(20),
    capital_id varchar2(5)
  );
  INSERT INTO GuessTheCapital VALUES('&con_name','&cap_id');
  SELECT * FROM GuessThecapital;
  update GuessThecapital set capital_id = '1W' where country_name='USA';
  SELECT country_name,capital_id,
  DECODE (capital_id,
        '1D', 'Dehli',
        '1L', 'London',
        '1W', 'Washington',
        '1T', 'Tokiyo',
        'SORRY'
        ) As Capitals
    FROM GuessTheCapital;
      
         
  
  
  
  
  