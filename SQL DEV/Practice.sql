CREATE TABLE Buddy
(
   NAME VARCHAR2(30),
   G_Name VARCHAR2(30)
   );
INSERT INTO Buddy VALUES('&Name','&GF_NAME');
SELECT * FROM buddy;
SELECT name||', Your GirlFriends Name Is '||G_NAME AS GIRLFRIEND FROM buddy;
delete from buddy;

INSERT INTO buddy VALUES(UPPER('&NAME'),UPPER('&G_NAME'));
INSERT INTO buddy VALUES(LOWER('&NAME'),LOWER('&G_NAME'));
INSERT INTO buddy VALUES(INITCAP('&NAME'),INITCAP('&G_NAME'));


SELECT substr('Sonu Shaikh',-6) FROM dual;
ALTER TABLE buddy RENAME TO chicks;
describe chicks;
ALTER TABLE chicks RENAME TO buddy;
DESC buddy;


ALTER TABLE buddy RENAME COLUMN G_NAME TO GIRLFRIEND_NAME ;
DESC departments;
DESC locations;

SELECT * FROM departments;
SELECT * FROM locations;
SELECT department_name,city FROM departments NATURAL JOIN locations;
SELECT DEPARTMENT_NAME, CITY FROM departments d JOIN locations l ON ( d.location_Id = l.location_Id);
SELECT first_name,department_name FROM departments JOIN employees USING(manager_Id);
DESC STUDENT;
SELECT * FROM STUDENT;

CREATE TABLE STUDENTCROSS
(
    std_id NUMBER,
    name VARCHAR(20)
    );
    insert into STUDENTCROSS values(2,'Shital');
    INSERT INTO STUDENT VALUES('bob','M',007,2);
SELECT * FROM student,STUDENTCROSS;
SELECT FIRST_NAME, phone_no , Name FROM student CROSS JOIN STUDENTCROSS WHERE student.first_name='sonu';

-- CRATE USER ACCOUNT
CREATE USER SONUMONUUSER
IDENTIFIED BY sonumonu
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA 20M ON users
ACCOUNT unlock;
   
CREATE USER USER1
IDENTIFIED BY sonu
DEFAULT TABLESPACE users 
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users
PASSWORD EXPIRE;
ALTER USER USER1
ACCOUNT UNLOCK;

GRANT CREATE SESSION TO SONUMONUUSER;

DROP USER USER1;
DISCONNECT USER1;
ALTER SYSTEM enable RESTRICTED SESSION;

