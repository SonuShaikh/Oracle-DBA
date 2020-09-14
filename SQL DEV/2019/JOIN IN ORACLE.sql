-- JOINS IN ORACLE
--SCENARIO 1: When there only one common column in source and target table
SELECT DEPARTMENT_NAME,CITY FROM DEPARTMENTS NATURAL JOIN LOCATIONS;

SELECT CITY,COUNT(DEPARTMENT_NAME) AS TOTAL_DEPT FROM DEPARTMENTS NATURAL JOIN LOCATIONS GROUP BY CITY;

--SCENARIO 1: When source and target table have more than one common column.
-- PURE NATURAL JOIN
SELECT DEPARTMENT_NAME , COUNT(EMPLOYEE_ID) FROM EMPLOYEES NATURAL JOIN DEPARTMENTS GROUP BY DEPARTMENT_NAME ORDER BY 1;

--NATURAL JOIN USING ON CLAUSE
SELECT FIRST_NAME,DEPARTMENT_NAME FROM EMPLOYEES EMP JOIN DEPARTMENTS DEPT
ON (EMP.DEPARTMENT_ID = DEPT.DEPARTMENT_ID
AND EMP.MANAGER_ID = DEPT.MANAGER_ID);

SELECT * FROM DEPARTMENTS;
SELECT COUNT(EMPLOYEE_ID),MANAGER_ID FROM EMPLOYEES GROUP BY MANAGER_ID ORDER BY 1;

-- DEPARTMENT MANAGER NAME
SELECT DEPARTMENT_NAME, FIRST_NAME AS DEPT_MANAGER FROM EMPLOYEES EMP JOIN DEPARTMENTS DEPT
ON EMP.EMPLOYEE_ID =  DEPT.MANAGER_ID;
SELECT UNIQUE DEPARTMENT_NAME FROM DEPARTMENTS;

-- NATURAL JOIN WITH USING CLAUSE
SELECT DEPARTMENT_NAME,FIRST_NAME FROM EMPLOYEES EMP JOIN DEPARTMENTS DEPT
USING(MANAGER_ID);



SELECT FIRST_NAME,emp.department_id,department_name,emp.manager_id empman,dept.manager_id deptman FROM DEPARTMENTS DEPT RIGHT OUTER JOIN  EMPLOYEES EMP ON(EMP.MANAGER_ID = DEPT.MANAGER_ID); 

SELECT COUNT(FIRST_NAME) FROM EMPLOYEES;
select * from departments;

SELECT * FROM EMP;
SELECT * FROM DEPT;
INSERT INTO DEPT VALUES('MANAGER',2,4);

--RIGHT OUTER JOIN
SELECT EMP.EMP_ID,DEPT.DEPT_NAME,DEPT_ID FROM DEPT RIGHT OUTER JOIN EMP ON(EMP.EMP_ID = DEPT.EMP_ID);

SELECT EMP.EMP_ID,DEPT.DEPT_NAME FROM DEPT RIGHT OUTER JOIN EMP USING(EMP_ID);


DESCRIBE EMP;
DESCRIBE DEPT;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'DEPT';

ALTER TABLE EMP RENAME COLUMN DEPT_NAME TO EMP_NAME;
ALTER TABLE DEPT DISABLE CONSTRAINT DEPT_COL3_FK;

INSERT INTO EMP VALUES(&EMP_ID,'&EMP_NAME',&SALARY);
INSERT INTO DEPT VALUES(&DEPT_ID,'&DEPT_NAME',&EMP_ID);
INSERT INTO DEPT(DEPT_ID,DEPT_NAME) VALUES (4,'SUPPORT');
INSERT INTO DEPT(DEPT_ID,DEPT_NAME) VALUES (5,'ITSO');


SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT * FROM EMP NATURAL JOIN DEPT;
-- RIGHT OURTER JOIN
SELECT EMP.EMP_ID,EMP_NAME,EMP_SALARY,DEPT_NAME FROM DEPT RIGHT OUTER JOIN EMP 
ON(EMP.EMP_ID = DEPT.EMP_ID) WHERE EMP_SALARY < 5000;


SELECT EMP.EMP_ID,EMP_NAME,EMP_SALARY,DEPT_NAME FROM EMP RIGHT OUTER JOIN DEPT 
ON(EMP.EMP_ID = DEPT.EMP_ID)






