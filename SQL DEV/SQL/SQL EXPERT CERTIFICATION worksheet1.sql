-- CREATE TABLE WITH CONTRAINT
CREATE TABLE create_demo
(
   first_name VARCHAR2(200) NOT NULL,
   last_name VARCHAR2(200) NOT NULL,
   contact_no NUMBER(10) CONSTRAINT cd_check_number CHECK (LENGTH(contact_no) = 10) UNIQUE NOT NULL,
   email_add VARCHAR2(255) CONSTRAINT cd_unique_emial UNIQUE,
   city VARCHAR2(255) NOT NULL,
   country VARCHAR2(255)   -- CONSTRAINT cd_default_value DEFAULT 'India'
);

ALTER TABLE create_demo MODIFY country VARCHAR2(20) DEFAULT 'India'; 
ALTER TABLE create_demo ADD student_id NUMBER CONSTRAINT cd_constr_pk PRIMARY KEY;

INSERT INTO create_demo(first_name,last_name,contact_no,email_add,city,student_id) 
VALUES(UPPER('&first_name'),'&last_name',&contact_no,'&email_add','&city',&student_id);
SELECT * FROM create_demo;

-- sql key word

SELECT first_name,salary FROM hr.employees WHERE employee_id > 130 AND salary > 1500;
SELECT first_name,salary FROM hr.employees WHERE employee_id NOT IN(2500);

DESC HR.EMPLOYEES;
DESC HR.DEPARTMENTS;
SELECT department_id, department_name FROM HR.DEPARTMENTS;



CREATE TABLE college_studnet
(
   stud_id NUMBER CONSTRAINT clgstd_sid_pk PRIMARY KEY,
   stud_name VARCHAR2(20),
   stud_contact NUMBER(10)
);

DESC college_studnet;

SELECT * FROM college_studnet;
INSERT INTO college_studnet VALUES(2,'SAHIL',9623858600);


CREATE TABLE stud_subject
(
   sub_stud_id NUMBER CONSTRAINT suj_sid_fk REFERENCES college_studnet(stud_id),
   sub_name VARCHAR2(20)
   );

INSERT INTO STUD_SUBJECT VALUES(1,'dbms');
select * from stud_subject;

--SELECT stud_id,stud_name,stud_cotact,sub_name FROM college_studnet ct JOIN stud_subjcet ss 
--WHERE ct.stud_id = ss.sub_stud_id; 



SELECT TO_CHAR(1230,'00,999.99') FROM DUAL;
DESC HR.employees;
select salary,commission_pct FROM HR.employees WHERE commission_pct IS NOT NULL;

SELECT first_name, NVL(salary * commission_pct, 0) 
FROM HR.employees 
WHERE commission_pct IS NOT NULL;

--You want to display the annual commission amount payable to each employee. 
SELECT first_name,NVL(commission_pct,0),NVL(commission_pct,0) + 100 FROM hr.employees WHERE salary > 13000;

SELECT first_name, salary, salary*12*commission_pct AS Annual_commission FROM hr.employees WHERE commission_pct IS NOT NULL;
SELECT salary, NVL2 (12 * salary * COMMISSION_PCT,0) FROM hr.employees;
SELECT salary, COALESCE(12 * salary * commission_pct,0) As Annual_commision FROM hr.employees;
SELECT salary, DECODE(12 * salary * commission_pct,NULL,0) As Annual_commision FROM hr.employees;

CREATE TABLE emp_d
(empno NUMBER PRIMARY KEY, 
ename VARCHAR2(25)  NOT NULL, 
dob   TIMESTAMP DEFAULT SYSDATE, 
hire_date  DATE CONSTRAINT h_dt_chk CHECK (hire_date <= SYSDATE)); 

SHOW USER;
DESC STUDENT;

INSERT INTO STUDENTCOPY VALUES(&stud_id,'&first_name','&last_name',&contact_no);
SAVEPOINT sc_1;
UPDATE STUDENTCOPY SET stud_id = 10 WHERE stud_id = 1;
SAVEPOINT sc_2;
COMMIT;
ROLLBACK TO SAVEPOINT sc_2;
SELECT * FROM STUDENTCOPY;
DISCONNECT;






