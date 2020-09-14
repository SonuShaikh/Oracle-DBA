SELECT * FROM HR.EMPLOYEES;
--NOT IN and NULL : A dangerous combination. 
SELECT FIRST_NAME||' '||LAST_NAME AS MANAGAER_NAME FROM HR.EMPLOYEES 
WHERE EMPLOYEE_ID NOT IN (SELECT MANAGER_ID FROM HR.DEPARTMENTS);

--
SELECT COUNT(*) TOT_EMP FROM HR.EMPLOYEES;
--
SELECT COUNT(*) TOT_EMPL FROM HR.EMPLOYEES WHERE EMPLOYEE_ID NOT IN (
    SELECT COALESCE(MANAGER_ID,-1) FROM HR.DEPARTMENTS);
--
SELECT COUNT(*) TOT_EMP FROM HR.EMPLOYEES E WHERE NOT EXISTS (
    SELECT MANAGER_ID FROM HR.DEPARTMENTS D WHERE D.MANAGER_ID = E.EMPLOYEE_ID);
--
SELECT FIRST_NAME FROM HR.EMPLOYEES WHERE EMPLOYEE_ID NOT IN (
    SELECT MANAGER_ID FROM HR.DEPARTMENTS WHERE MANAGER_ID IS NOT NULL);
    